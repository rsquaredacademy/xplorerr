context("test-blr-regress.R")

test_that("output from blr_regress is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  k <- blr_regress(model, odd_conf_limit = TRUE)

  x <- cat(
    "✔ Creating model overview. 
✔ Creating response profile. 
✔ Extracting maximum likelihood estimates. 
✔ Computing odds ratio estimates. 
✔ Estimating concordant and discordant pairs. 

                             Model Overview                              
------------------------------------------------------------------------
Data Set    Resp Var    Obs.    Df. Model    Df. Residual    Convergence 
------------------------------------------------------------------------
  data      honcomp     200        199           196            TRUE     
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
(Intercept)    1     -12.7772       1.9755    -6.4677      0.0000 
  female1      1      1.4825        0.4474     3.3139       9e-04 
   read        1      0.1035        0.0258     4.0186       1e-04 
  science      1      0.0948        0.0305     3.1129      0.0019 
-----------------------------------------------------------------

                  Odds Ratio Estimates                    
---------------------------------------------------------
 Effects          Estimate          95% Wald Conf. Limit 
---------------------------------------------------------
 female1           4.4039          1.8955         11.0521 
   read            1.1091          1.0569          1.1699 
 science           1.0994          1.0377          1.1702 
---------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses  
---------------------------------------------------------------
% Concordant          0.8561          Somers' D        0.7147   
% Discordant          0.1425          Gamma            0.7136   
% Tied                0.0014          Tau-a            0.2794   
Pairs                  7791           c                0.8568   
---------------------------------------------------------------"
  )

  expect_output(print(k), x)
})
