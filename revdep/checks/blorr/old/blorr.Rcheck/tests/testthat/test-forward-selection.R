context("test-forward-selection.R")

test_that("output from forward variable selection is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  actual   <- blr_step_aic_forward(model)$predictors 
  expected <- c("read", "female", "science")

  expect_equivalent(actual, expected)
})

test_that("output from forward variable p selection is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  actual   <- blr_step_p_forward(model)$predictors
  expected <- c("read", "female", "science")

  expect_equivalent(actual, expected)
})


test_that("output from forward variable selection is as expected", {

  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  x <- cat("Forward Selection Method 
------------------------

Candidate Terms: 

1 . female 
2 . read 
3 . science 


Variables Entered: 

✔ read 
✔ female 
✔ science 

                 Selection Summary                  
---------------------------------------------------
Step    Variable       AIC        BIC      Deviance 
---------------------------------------------------
1       read         183.063    189.660     179.063 
2       female       176.887    176.887     176.887 
3       science      168.236    168.236     168.236 
---------------------------------------------------")

  expect_output(print(blr_step_aic_forward(model)), x)

})

test_that("output from forward variable p selection is as expected", {

  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  x <- cat("Forward Selection Method    
---------------------------

Candidate Terms: 

1. female1 
2. read 
3. science 

We are selecting variables based on p value...

Variables Entered: 

✔ read 
✔ science 
✔ female1 


Final Model Output 
------------------

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     372        371           368            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              290              1              82     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -11.5804       1.3980    -8.2836      0.0000 
   read        1      0.1000        0.0210     4.7651      0.0000 
  science      1      0.0798        0.0246     3.2390      0.0012 
  female1      1      0.9324        0.3126     2.9826      0.0029 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8259          Somers' D        0.6607   
% Discordant          0.1687          Gamma            0.6572   
% Tied                0.0054          Tau-a            0.2265   
Pairs                 23780           c                0.8286   
---------------------------------------------------------------


                 Selection Summary                   
----------------------------------------------------
        Variable                                        
Step    Entered       AIC         BIC       Deviance    
----------------------------------------------------
   1    read        316.3831    324.2209    312.3831    
   2    science     310.5294    322.2861    304.5294    
   3    female1     303.0855    318.7611    295.0855    
----------------------------------------------------")

  expect_output(print(blr_step_p_forward(model)), x)

})

test_that("output from forward variable selection is as expected", {

  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  x <- cat("Forward Selection Method    
---------------------------

Candidate Terms: 

1. female1 
2. read 
3. science 

We are selecting variables based on p value...


Forward Selection: Step 1 

✔ read 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     372        371           370            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              290              1              82     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -8.5704        0.9875    -8.6789      0.0000 
   read        1      0.1340        0.0172     7.7741      0.0000 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.7771          Somers' D        0.6582   
% Discordant          0.1602          Gamma            0.6169   
% Tied                0.0627          Tau-a            0.2126   
Pairs                 23780           c                0.8085   
---------------------------------------------------------------




Forward Selection: Step 2 

✔ science 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     372        371           369            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              290              1              82     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -10.1484       1.2142    -8.3581      0.0000 
   read        1      0.0990        0.0207     4.7938      0.0000 
  science      1      0.0643        0.0233     2.7592      0.0058 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8181          Somers' D        0.6510   
% Discordant          0.1729          Gamma            0.6452   
% Tied                0.0090          Tau-a            0.2223   
Pairs                 23780           c                0.8226   
---------------------------------------------------------------




Forward Selection: Step 3 

✔ female1 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     372        371           368            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              290              1              82     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -11.5804       1.3980    -8.2836      0.0000 
   read        1      0.1000        0.0210     4.7651      0.0000 
  science      1      0.0798        0.0246     3.2390      0.0012 
  female1      1      0.9324        0.3126     2.9826      0.0029 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8259          Somers' D        0.6607   
% Discordant          0.1687          Gamma            0.6572   
% Tied                0.0054          Tau-a            0.2265   
Pairs                 23780           c                0.8286   
---------------------------------------------------------------





Variables Entered: 

✔ read 
✔ science 
✔ female1 


Final Model Output 
------------------

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     372        371           368            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              290              1              82     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -11.5804       1.3980    -8.2836      0.0000 
   read        1      0.1000        0.0210     4.7651      0.0000 
  science      1      0.0798        0.0246     3.2390      0.0012 
  female1      1      0.9324        0.3126     2.9826      0.0029 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8259          Somers' D        0.6607   
% Discordant          0.1687          Gamma            0.6572   
% Tied                0.0054          Tau-a            0.2265   
Pairs                 23780           c                0.8286   
---------------------------------------------------------------


                 Selection Summary                   
----------------------------------------------------
        Variable                                        
Step    Entered       AIC         BIC       Deviance    
----------------------------------------------------
   1    read        316.3831    324.2209    312.3831    
   2    science     310.5294    322.2861    304.5294    
   3    female1     303.0855    318.7611    295.0855    
----------------------------------------------------")

  expect_output(print(blr_step_aic_forward(model, details = TRUE)), x)
  
})


