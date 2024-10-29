context("test-bivariate-analysis.R")

test_that("output from blr_bivariate_analysis is as expected", {
  k <- blr_bivariate_analysis(hsb2, honcomp, female, prog)
  expect_equivalent(k$iv, c(0.1023, 0.4329))
  expect_equivalent(round(k$likelihood_ratio, 2), c(3.94, 16.15))
})


test_that("blr_bivariate_analysis prints the correct output", {
  k <- blr_bivariate_analysis(hsb2, honcomp, female, prog)

  x <- cat("                         Bivariate Analysis
---------------------------------------------------------------------
           Variable    Information Value    LR Chi Square    LR DF    LR p-value
           ---------------------------------------------------------------------
           female           0.10              3.9350          1        0.0473
           prog            0.43              16.1450         2        3e-04
           ---------------------------------------------------------------------")

  expect_output(print(k), x)
})

test_that("output from blr_segment is as expected", {
  
  k        <- blr_segment(hsb2, honcomp, race)
  actual   <- rev(k$segment_data[['1s%']])[1]
  expected <- c(0.22)

  expect_equivalent(actual, expected)
})

test_that("blr_segment prints the correct output", {
  k <- blr_segment(hsb2, honcomp, race)

  x <- cat("Event By Attributes
-------------------
           race           1s%
           -------------------
           1             0.01
           2             0.02
           3             0.01
           4             0.22
           -------------------")

  expect_output(print(k), x)
})

test_that("output from blr_twoway_segment is as expected", {

  k        <- blr_segment_twoway(hsb2, honcomp, prog, race)
  actual   <- unname(round(k$twoway_segment[, 4], 3))
  expected <- c(0.035, 0.165, 0.020)
  expect_equivalent(actual, expected)
})

test_that("blr_twoway_segment prints the correct output", {
  k <- blr_segment_twoway(hsb2, honcomp, prog, race)

  x <- cat(
    "                         race
-----------------------------------------
    prog      1       2       3       4
    -----------------------------------------
    1     0.000   0.000   0.000   0.035
    -----------------------------------------
    2     0.010   0.020   0.005   0.165
    -----------------------------------------
    3     0.000   0.005   0.005   0.020
    -----------------------------------------"
  )

  expect_output(print(k), x)
})

test_that("output from blr_segment_dist is as expected", {
  
  k        <- blr_segment_dist(hsb2, honcomp, race)
  actual   <- rev(k$dist_table[['1s%']])[1]
  expected <- c(0.22)
  expect_equivalent(actual, expected)
})

test_that("blr_twoway_segment prints the correct output", {
  k <- blr_segment_dist(hsb2, honcomp, race)

  x <- cat(
    "         Event Segmentation
-------------------------------------
    race       n     1s     n%     1s%
    -------------------------------------
    1        24     2     0.12    0.01
    2        11     5     0.06    0.02
    3        20     2     0.10    0.01
    4        145    44    0.72    0.22
    -------------------------------------"
  )

  expect_output(print(k), x)
})


test_that("output from blr_woe_iv is as expected", {
  k        <- blr_woe_iv(hsb2, prog, honcomp)
  actual   <- sum(k$woe_iv_table[['iv']])
  expected <- 0.4329
  expect_equal(actual, expected)
})

test_that("blr_woe_iv prints the correct output", {
  k <- blr_woe_iv(hsb2, prog, honcomp)

  x <- cat(
    "                           Weight of Evidence                             
-------------------------------------------------------------------------
levels    count_0s    count_1s    dist_0s    dist_1s        woe      iv   
-------------------------------------------------------------------------
  1          38          7           0.26       0.13       0.67     0.08  
  2          65          40          0.44       0.75      -0.53     0.17  
  3          44          6           0.30       0.11       0.97     0.18  
-------------------------------------------------------------------------

      Information Value       
-----------------------------
Variable    Information Value 
-----------------------------
  prog           0.4329       
-----------------------------")

  expect_output(print(k), x)
})


test_that("output from blr_woe_iv_stats is as expected", {

  k <- blr_woe_iv_stats(hsb2, honcomp, prog, race, female, schtyp)

  x <- cat("Variable: prog

                           Weight of Evidence                             
-------------------------------------------------------------------------
levels    count_0s    count_1s    dist_0s    dist_1s        woe      iv   
-------------------------------------------------------------------------
  1          38          7           0.26       0.13       0.67     0.08  
  2          65          40          0.44       0.75      -0.53     0.17  
  3          44          6           0.30       0.11       0.97     0.18  
-------------------------------------------------------------------------

      Information Value       
-----------------------------
Variable    Information Value 
-----------------------------
  prog           0.4329       
-----------------------------


Variable: race

                           Weight of Evidence                             
-------------------------------------------------------------------------
levels    count_0s    count_1s    dist_0s    dist_1s        woe      iv   
-------------------------------------------------------------------------
  1          22          2           0.15       0.04       1.38     0.15  
  2          6           5           0.04       0.09      -0.84     0.04  
  3          18          2           0.12       0.04       1.18     0.10  
  4         101          44          0.69       0.83      -0.19     0.03  
-------------------------------------------------------------------------

      Information Value       
-----------------------------
Variable    Information Value 
-----------------------------
  race            0.326       
-----------------------------


Variable: female

                           Weight of Evidence                             
-------------------------------------------------------------------------
levels    count_0s    count_1s    dist_0s    dist_1s        woe      iv   
-------------------------------------------------------------------------
  0          73          18          0.50       0.34       0.38     0.06  
  1          74          35          0.50       0.66      -0.27     0.04  
-------------------------------------------------------------------------

      Information Value       
-----------------------------
Variable    Information Value 
-----------------------------
 female          0.1023       
-----------------------------


Variable: schtyp

                           Weight of Evidence                            
------------------------------------------------------------------------
levels    count_0s    count_1s    dist_0s    dist_1s        woe     iv   
------------------------------------------------------------------------
  1         123          45          0.84       0.85      -0.01    0.00  
  2          24          8           0.16       0.15       0.08    0.00  
------------------------------------------------------------------------

      Information Value       
-----------------------------
Variable    Information Value 
-----------------------------
 schtyp          0.0012       
-----------------------------")

  expect_output(print(k), x)

})
