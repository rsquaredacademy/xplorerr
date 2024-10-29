context("test-backward-elimination.R")

test_that("output from backward variable elimination is as expected", {
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  actual   <- blr_step_aic_backward(model)$predictors
  expected <- c("prog", "socst")

  expect_equivalent(actual, expected)
})

test_that("output from backward variable p elimination is as expected", {
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  actual   <- blr_step_p_backward(model)$removed
  expected <- c("prog", "socst")

  expect_equivalent(actual, expected)
})

test_that("print output from backward variable elimination is as expected", {
  
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  x <- cat("Backward Elimination Method 
---------------------------

Candidate Terms: 

1 . female 
2 . read 
3 . science 
4 . math 
5 . prog 
6 . socst 


Variables Removed: 

✖ prog 
✖ socst 


         Backward Elimination Summary         
--------------------------------------------
Variable        AIC        BIC      Deviance 
--------------------------------------------
Full Model    162.424    188.811     146.424 
prog          158.953    178.743     146.953 
socst         157.286    173.777     147.286 
--------------------------------------------")

  expect_output(print(blr_step_aic_backward(model)), x)

})

test_that("print output from backward variable p elimination is as expected", {
  
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  x <- cat("Backward Elimination Method 
---------------------------

Candidate Terms: 

1 . female1 
2 . read 
3 . science 
4 . math 
5 . prog2 
6 . prog3 
7 . socst 

We are eliminating variables based on p value...

Variables Removed: 

✖ prog3 
✖ prog2 
✖ socst 

No more variables satisfy the condition of p value = 0.3


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
  data      honcomp     200        199           195            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.5773       2.1568    -6.7589      0.0000 
  female1      1      1.3622        0.4605     2.9580      0.0031 
   read        1      0.0631        0.0281     2.2455      0.0247 
  science      1      0.0569        0.0326     1.7429      0.0814 
   math        1      0.1113        0.0338     3.2992      0.0010 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8835          Somers' D        0.7669   
% Discordant          0.1165          Gamma            0.7669   
% Tied                0.0000          Tau-a            0.3003   
Pairs                  7791           c                0.8835   
---------------------------------------------------------------



                Elimination Summary                  
----------------------------------------------------
        Variable                                        
Step    Removed       AIC         BIC       Deviance    
----------------------------------------------------
   1    prog3       160.7102    183.7984    146.7102    
   2    prog2       158.9527    178.7427    146.9527    
   3    socst       157.2856    173.7772    147.2856    
----------------------------------------------------")

  expect_output(print(blr_step_p_backward(model)), x)

})

test_that("output from backward variable elimination is as expected when details == TRUE", {
  
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  x <- cat("Backward Elimination Method 
---------------------------

Candidate Terms: 

1 . female 
2 . read 
3 . science 
4 . math 
5 . prog 
6 . socst 

 Step 0: AIC = 162.4241 
 honcomp ~ female + read + science + math + prog + socst 

-------------------------------------------------
Variable     DF      AIC        BIC      Deviance 
-------------------------------------------------
prog         1     158.953    178.743     146.953 
socst        1     160.745    183.834     146.745 
read         1     163.394    186.482     149.394 
science      1     163.815    186.903     149.815 
female       1     169.570    192.658     155.570 
math         1     170.017    193.105     156.017 
-------------------------------------------------


✖ prog 


  Step 1 : AIC = 158.9527 
 honcomp ~ female + read + science + math + socst 

-------------------------------------------------
Variable     DF      AIC        BIC      Deviance 
-------------------------------------------------
socst        1     157.286    173.777     147.286 
science      1     159.941    176.432     149.941 
read         1     160.307    176.798     150.307 
female       1     166.114    182.606     156.114 
math         1     168.669    185.161     158.669 
-------------------------------------------------

✖ socst 


  Step 2 : AIC = 157.2856 
 honcomp ~ female + read + science + math 

-------------------------------------------------
Variable     DF      AIC        BIC      Deviance 
-------------------------------------------------
science      1     158.420    171.613     150.420 
read         1     160.658    173.851     152.658 
female       1     164.988    178.181     156.988 
math         1     168.236    181.430     160.236 
-------------------------------------------------

No more variables to be removed.

Variables Removed: 

✖ prog 
✖ socst 


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
  data      honcomp     200        199           195            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.5773       2.1568    -6.7589      0.0000 
  female1      1      1.3622        0.4605     2.9580      0.0031 
   read        1      0.0631        0.0281     2.2455      0.0247 
  science      1      0.0569        0.0326     1.7429      0.0814 
   math        1      0.1113        0.0338     3.2992      0.0010 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8835          Somers' D        0.7669   
% Discordant          0.1165          Gamma            0.7669   
% Tied                0.0000          Tau-a            0.3003   
Pairs                  7791           c                0.8835   
---------------------------------------------------------------



         Backward Elimination Summary         
--------------------------------------------
Variable        AIC        BIC      Deviance 
--------------------------------------------
Full Model    162.424    188.811     146.424 
prog          158.953    178.743     146.953 
socst         157.286    173.777     147.286 
--------------------------------------------")

  expect_output(print(blr_step_aic_backward(model, details = TRUE)), x)

})

test_that("output from backward variable elimination p is as expected when details == TRUE", {
  
  model <- glm(
    honcomp ~ female + read + science + math + prog + socst,
    data = hsb2, family = binomial(link = "logit")
  )

  x <- cat("Backward Elimination Method 
---------------------------

Candidate Terms: 

1 . female1 
2 . read 
3 . science 
4 . math 
5 . prog2 
6 . prog3 
7 . socst 

We are eliminating variables based on p value...

✖ prog3 

Backward Elimination: Step 1 

 Variable prog3 Removed 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     200        199           193            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.7222       2.2246    -6.6180      0.0000 
  female1      1      1.3547        0.4659     2.9075      0.0036 
   read        1      0.0541        0.0311     1.7420      0.0815 
  science      1      0.0605        0.0341     1.7729      0.0762 
   math        1      0.1033        0.0357     2.8968      0.0038 
   prog2       1      0.2382        0.4839     0.4922      0.6226 
   socst       1      0.0135        0.0273     0.4953      0.6204 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8845          Somers' D        0.7690   
% Discordant          0.1155          Gamma            0.7690   
% Tied                0.0000          Tau-a            0.3011   
Pairs                  7791           c                0.8845   
---------------------------------------------------------------



✖ prog2 

Backward Elimination: Step 2 

 Variable prog2 Removed 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     200        199           194            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.8131       2.2101    -6.7024      0.0000 
  female1      1      1.3351        0.4634     2.8813      0.0040 
   read        1      0.0558        0.0309     1.8050      0.0711 
  science      1      0.0561        0.0329     1.7036      0.0885 
   math        1      0.1086        0.0342     3.1761      0.0015 
   socst       1      0.0155        0.0270     0.5738      0.5661 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8822          Somers' D        0.7643   
% Discordant          0.1178          Gamma            0.7643   
% Tied                0.0000          Tau-a            0.2992   
Pairs                  7791           c                0.8822   
---------------------------------------------------------------



✖ socst 

Backward Elimination: Step 3 

 Variable socst Removed 

✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     200        199           195            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.5773       2.1568    -6.7589      0.0000 
  female1      1      1.3622        0.4605     2.9580      0.0031 
   read        1      0.0631        0.0281     2.2455      0.0247 
  science      1      0.0569        0.0326     1.7429      0.0814 
   math        1      0.1113        0.0338     3.2992      0.0010 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8835          Somers' D        0.7669   
% Discordant          0.1165          Gamma            0.7669   
% Tied                0.0000          Tau-a            0.3003   
Pairs                  7791           c                0.8835   
---------------------------------------------------------------




No more variables satisfy the condition of p value = 0.3


Variables Removed: 

✖ prog3 
✖ prog2 
✖ socst 


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
  data      honcomp     200        199           195            TRUE     
------------------------------------------------------------------------

                    Response Summary                     
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency 
--------------------------------------------------------
   0              147              1              53     
--------------------------------------------------------

                  Maximum Likelihood Estimates                    
-----------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value    Pr(>|z|) 
-----------------------------------------------------------------
(Intercept)    1     -14.5773       2.1568    -6.7589      0.0000 
  female1      1      1.3622        0.4605     2.9580      0.0031 
   read        1      0.0631        0.0281     2.2455      0.0247 
  science      1      0.0569        0.0326     1.7429      0.0814 
   math        1      0.1113        0.0338     3.2992      0.0010 
-----------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8835          Somers' D        0.7669   
% Discordant          0.1165          Gamma            0.7669   
% Tied                0.0000          Tau-a            0.3003   
Pairs                  7791           c                0.8835   
---------------------------------------------------------------



                Elimination Summary                  
----------------------------------------------------
        Variable                                        
Step    Removed       AIC         BIC       Deviance    
----------------------------------------------------
   1    prog3       160.7102    183.7984    146.7102    
   2    prog2       158.9527    178.7427    146.9527    
   3    socst       157.2856    173.7772    147.2856    
----------------------------------------------------")

  expect_output(print(blr_step_p_backward(model, details = TRUE)), x)

})


