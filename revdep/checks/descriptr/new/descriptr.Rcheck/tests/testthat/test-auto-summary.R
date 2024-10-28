context("test-auto-summary")

ndata <- dplyr::select(mtcarz, mpg, disp, hp, wt, qsec, drat)
fdata <- dplyr::select(mtcarz, cyl, gear, am, vs)

test_that("ds_auto_summary throws errors as expected", {
  expect_error(ds_auto_summary_stats(fdata), 'Data has no continuous variables.')
  expect_error(ds_auto_summary_stats(mtcarz, cyl, gear), 'Data has no continuous variables.')
})

test_that("ds_auto_group_summary throws errors as expected", {
  expect_error(ds_auto_group_summary(fdata), 'Data has no continuous variables.')
  expect_error(ds_auto_group_summary(ndata), 'Data has no categorical variables.')
  expect_error(ds_auto_group_summary(mtcarz, cyl, gear), 'Data has no continuous variables.')
  expect_error(ds_auto_group_summary(mtcarz, mpg, disp), 'Data has no categorical variables.')
})

test_that("ds_auto_freq_table throws errors as expected", {
  expect_error(ds_auto_freq_table(ndata), 'Data has no categorical variables.')
  expect_error(ds_auto_freq_table(mtcarz, mpg, disp), 'Data has no categorical variables.')
})

test_that("ds_auto_cross_table throws errors as expected", {
  expect_error(ds_auto_cross_table(ndata), 'Data has no categorical variables.')
  expect_error(ds_auto_cross_table(mtcarz, mpg, disp), 'Data has no categorical variables.')
  expect_error(ds_auto_cross_table(mtcarz, cyl), 'Two way table requires at least 2 categorical variables.')
})

test_that("output from ds_auto_summary is as expected", {
  pim <- "--------------------------- Variable: mpg --------------------------

------------------------ Summary Statistics ------------------------

                        Univariate Analysis                          

 N                       32.00      Variance                36.32 
 Missing                  0.00      Std Deviation            6.03 
 Mean                    20.09      Range                   23.50 
 Median                  19.20      Interquartile Range      7.38 
 Mode                    10.40      Uncorrected SS       14042.31 
 Trimmed Mean            19.95      Corrected SS          1126.05 
 Skewness                 0.67      Coeff Variation         30.00 
 Kurtosis                -0.02      Std Error Mean           1.07 

                              Quantiles                               

              Quantile                            Value                

             Max                                  33.90                
             99%                                  33.44                
             95%                                  31.30                
             90%                                  30.09                
             Q3                                   22.80                
             Median                               19.20                
             Q1                                   15.43                
             10%                                  14.34                
             5%                                   12.00                
             1%                                   10.40                
             Min                                  10.40                

                            Extreme Values                            

                Low                                High                

  Obs                        Value       Obs                        Value 
  15                         10.4        20                         33.9  
  16                         10.4        18                         32.4  
  24                         13.3        19                         30.4  
   7                         14.3        28                         30.4  
  17                         14.7        26                         27.3  


---------------------- Frequency Distribution ----------------------

                              Variable: mpg                               
|-----------------------------------------------------------------------|
|    Bins     | Frequency | Cum Frequency |   Percent    | Cum Percent  |
|-----------------------------------------------------------------------|
| 10.4 - 15.1 |     6     |       6       |    18.75     |    18.75     |
|-----------------------------------------------------------------------|
| 15.1 - 19.8 |    12     |      18       |     37.5     |    56.25     |
|-----------------------------------------------------------------------|
| 19.8 - 24.5 |     8     |      26       |      25      |    81.25     |
|-----------------------------------------------------------------------|
| 24.5 - 29.2 |     2     |      28       |     6.25     |     87.5     |
|-----------------------------------------------------------------------|
| 29.2 - 33.9 |     4     |      32       |     12.5     |     100      |
|-----------------------------------------------------------------------|
|    Total    |    32     |       -       |    100.00    |      -       |
|-----------------------------------------------------------------------|


"
expect_output(ds_auto_summary_stats(mtcarz, mpg), pim)
})

test_that("output from ds_auto_group_summary is as expected", {
  pim <- "                                       mpg by cyl                                         
-----------------------------------------------------------------------------------------
|     Statistic/Levels|                    4|                    6|                    8|
-----------------------------------------------------------------------------------------
|                  Obs|                   11|                    7|                   14|
|              Minimum|                 21.4|                 17.8|                 10.4|
|              Maximum|                 33.9|                 21.4|                 19.2|
|                 Mean|                26.66|                19.74|                 15.1|
|               Median|                   26|                 19.7|                 15.2|
|                 Mode|                 22.8|                   21|                 10.4|
|       Std. Deviation|                 4.51|                 1.45|                 2.56|
|             Variance|                20.34|                 2.11|                 6.55|
|             Skewness|                 0.35|                -0.26|                -0.46|
|             Kurtosis|                -1.43|                -1.83|                 0.33|
|       Uncorrected SS|              8023.83|              2741.14|              3277.34|
|         Corrected SS|               203.39|                12.68|                 85.2|
|      Coeff Variation|                16.91|                 7.36|                16.95|
|      Std. Error Mean|                 1.36|                 0.55|                 0.68|
|                Range|                 12.5|                  3.6|                  8.8|
|  Interquartile Range|                  7.6|                 2.35|                 1.85|
-----------------------------------------------------------------------------------------



"

expect_output(ds_auto_group_summary(mtcarz, cyl, mpg), pim)
})


test_that("output from ds_auto_cross_table is as expected", {

  pim <- "    Cell Contents
 |---------------|
 |     Frequency |
 |       Percent |
 |       Row Pct |
 |       Col Pct |
 |---------------|

 Total Observations:  32 

                                cyl vs gear                                 
----------------------------------------------------------------------------
|              |                           gear                            |
----------------------------------------------------------------------------
|          cyl |            3 |            4 |            5 |    Row Total |
----------------------------------------------------------------------------
|            4 |            1 |            8 |            2 |           11 |
|              |        0.031 |         0.25 |        0.062 |              |
|              |         0.09 |         0.73 |         0.18 |         0.34 |
|              |         0.07 |         0.67 |          0.4 |              |
----------------------------------------------------------------------------
|            6 |            2 |            4 |            1 |            7 |
|              |        0.062 |        0.125 |        0.031 |              |
|              |         0.29 |         0.57 |         0.14 |         0.22 |
|              |         0.13 |         0.33 |          0.2 |              |
----------------------------------------------------------------------------
|            8 |           12 |            0 |            2 |           14 |
|              |        0.375 |            0 |        0.062 |              |
|              |         0.86 |            0 |         0.14 |         0.44 |
|              |          0.8 |            0 |          0.4 |              |
----------------------------------------------------------------------------
| Column Total |           15 |           12 |            5 |           32 |
|              |        0.468 |        0.375 |        0.155 |              |
----------------------------------------------------------------------------


"

expect_output(ds_auto_cross_table(mtcarz, cyl, gear), pim)

})