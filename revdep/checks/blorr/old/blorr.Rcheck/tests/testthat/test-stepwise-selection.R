context("test-stepwise-selection.R")

test_that("output from stepwise variable selection is as expected", {

  model    <- glm(y ~ ., data = stepwise, family = binomial(link = 'logit'))
  actual   <- blr_step_aic_both(model)$predictors
  expected <- c("x6", "x1", "x3", "x2", "x6", "x5")

  expect_equivalent(actual, expected)
})

test_that("output from stepwise variable p selection is as expected", {

   model   <- glm(y ~ ., data = stepwise, family = binomial(link = 'logit'))
  actual   <- blr_step_p_both(model)$orders
  expected <- c("x1", "x2", "x3", "x6", "x5", "x6")

  expect_equivalent(actual, expected)
})

test_that("print output from forward variable selection is as expected", {

  model <- glm(y ~ ., data = stepwise, family = binomial(link = 'logit'))

  x <- cat("Stepwise Selection Method
-------------------------

Candidate Terms:

1 . x1
2 . x2
3 . x3
4 . x4
5 . x5
6 . x6


Variables Entered/Removed:

✔ x6
✔ x1
✔ x3
✔ x2
✖ x6
✔ x5

No more variables to be added or removed.

                      Stepwise Summary
-----------------------------------------------------------
Variable     Method        AIC          BIC       Deviance
-----------------------------------------------------------
x6          addition    18869.627    18885.434    18865.627
x1          addition    18571.376    18595.087    18565.376
x3          addition    18016.724    18048.338    18008.724
x2          addition    16642.374    16681.891    16632.374
x6          removal     16640.653    16672.267    16632.653
x5          addition    16639.219    16678.736    16629.219
-----------------------------------------------------------")

  expect_output(print(blr_step_aic_both(model)), x)

})

test_that("print output from forward variable selection is as expected", {

  model <- glm(y ~ ., data = stepwise, family = binomial(link = 'logit'))

  x <- cat("Stepwise Selection Method
---------------------------

Candidate Terms:

1. x1
2. x2
3. x3
4. x4
5. x5
6. x6

We are selecting variables based on p value...

Variables Entered/Removed:

✔ x6
✔ x1
✔ x3
✔ x2
✔ x5
✖ x6

No more variables to be added/removed.


Final Model Output
------------------

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19995           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.5228        0.0287    -53.1302      0.0000
    x1         1      1.0276        0.0212     48.4927      0.0000
    x3         1      1.0260        0.0213     48.2799      0.0000
    x2         1      0.9807        0.0209     46.9690      0.0000
    x5         1      0.0357        0.0192      1.8531      0.0639
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8911          Somers' D        0.7821
% Discordant          0.1089          Gamma            0.7821
% Tied                0.0000          Tau-a            0.3911
Pairs                99998319         c                0.8911
---------------------------------------------------------------


                      Stepwise Selection Summary
----------------------------------------------------------------------
                     Added/
Step    Variable    Removed        AIC           BIC           C(p)
----------------------------------------------------------------------
   1       x6       addition     18869.627     18885.434    18865.6270
   2       x1       addition     18571.376     18595.087    18565.3760
   3       x3       addition     18016.724     18048.338    18008.7240
   4       x2       addition     16642.374     16681.891    16632.3740
   5       x5       addition     16640.883     16688.304    16628.8830
   6       x6       removal      16639.219     16678.736    16629.2190
----------------------------------------------------------------------")

  expect_output(print(blr_step_p_both(model)), x)

})

test_that("print output from forward variable p selection is as expected", {

  model <- glm(y ~ ., data = stepwise, family = binomial(link = 'logit'))

  x <- cat("Stepwise Selection Method
---------------------------

Candidate Terms:

1. x1
2. x2
3. x3
4. x4
5. x5
6. x6

We are selecting variables based on p value...


Stepwise Selection: Step 1

✔ x6

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19998           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.1331        0.0242    -46.8217      0.0000
    x6         1      0.7490        0.0107     69.8309      0.0000
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8558          Somers' D        0.7115
% Discordant          0.1442          Gamma            0.7115
% Tied                0.0000          Tau-a            0.3558
Pairs                99998319         c                0.8558
---------------------------------------------------------------




Stepwise Selection: Step 2

✔ x1

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19997           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.1836        0.0248    -47.8070      0.0000
    x6         1      0.6619        0.0116     56.9586      0.0000
    x1         1      0.3595        0.0210     17.0908      0.0000
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8610          Somers' D        0.7220
% Discordant          0.1390          Gamma            0.7220
% Tied                0.0000          Tau-a            0.3610
Pairs                99998319         c                0.8610
---------------------------------------------------------------




Stepwise Selection: Step 3

✔ x3

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19996           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.2730        0.0257    -49.4449      0.0000
    x6         1      0.4865        0.0135     35.9577      0.0000
    x1         1      0.5367        0.0229     23.4089      0.0000
    x3         1      0.5331        0.0232     22.9908      0.0000
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8704          Somers' D        0.7407
% Discordant          0.1296          Gamma            0.7407
% Tied                0.0000          Tau-a            0.3704
Pairs                99998319         c                0.8704
---------------------------------------------------------------




Stepwise Selection: Step 4

✔ x2

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19995           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.5229        0.0287    -53.1387      0.0000
    x6         1     -0.0102        0.0193     -0.5290      0.5968
    x1         1      1.0381        0.0287     36.1728      0.0000
    x3         1      1.0365        0.0290     35.7651      0.0000
    x2         1      0.9910        0.0285     34.7112      0.0000
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8910          Somers' D        0.7820
% Discordant          0.1090          Gamma            0.7820
% Tied                0.0000          Tau-a            0.3910
Pairs                99998319         c                0.8910
---------------------------------------------------------------




Stepwise Selection: Step 5

✔ x5

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19994           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.5228        0.0287    -53.1294      0.0000
    x6         1     -0.0112        0.0193     -0.5790      0.5626
    x1         1      1.0388        0.0287     36.1852      0.0000
    x3         1      1.0374        0.0290     35.7813      0.0000
    x2         1      0.9919        0.0286     34.7282      0.0000
    x5         1      0.0360        0.0193      1.8680      0.0618
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8911          Somers' D        0.7821
% Discordant          0.1089          Gamma            0.7821
% Tied                0.0000          Tau-a            0.3911
Pairs                99998319         c                0.8911
---------------------------------------------------------------




Stepwise Selection: Step 6

✖ x6

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19995           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.5228        0.0287    -53.1302      0.0000
    x1         1      1.0276        0.0212     48.4927      0.0000
    x3         1      1.0260        0.0213     48.2799      0.0000
    x2         1      0.9807        0.0209     46.9690      0.0000
    x5         1      0.0357        0.0192      1.8531      0.0639
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8911          Somers' D        0.7821
% Discordant          0.1089          Gamma            0.7821
% Tied                0.0000          Tau-a            0.3911
Pairs                99998319         c                0.8911
---------------------------------------------------------------




No more variables to be added/removed.


Final Model Output
------------------

✔ Creating model overview.
✔ Creating response profile.
✔ Extracting maximum likelihood estimates.
✔ Estimating concordant and discordant pairs.

                             Model Overview
-------------------------------------------------------------------------
Data Set    Resp Var     Obs.    Df. Model    Df. Residual    Convergence
-------------------------------------------------------------------------
  data         y        20000      19999         19995           TRUE
-------------------------------------------------------------------------

                    Response Summary
--------------------------------------------------------
Outcome        Frequency        Outcome        Frequency
--------------------------------------------------------
   0             10041             1             9959
--------------------------------------------------------

                   Maximum Likelihood Estimates
------------------------------------------------------------------
 Parameter     DF    Estimate    Std. Error    z value     Pr(>|z|)
------------------------------------------------------------------
(Intercept)    1     -1.5228        0.0287    -53.1302      0.0000
    x1         1      1.0276        0.0212     48.4927      0.0000
    x3         1      1.0260        0.0213     48.2799      0.0000
    x2         1      0.9807        0.0209     46.9690      0.0000
    x5         1      0.0357        0.0192      1.8531      0.0639
------------------------------------------------------------------

 Association of Predicted Probabilities and Observed Responses
---------------------------------------------------------------
% Concordant          0.8911          Somers' D        0.7821
% Discordant          0.1089          Gamma            0.7821
% Tied                0.0000          Tau-a            0.3911
Pairs                99998319         c                0.8911
---------------------------------------------------------------


                      Stepwise Selection Summary
----------------------------------------------------------------------
                     Added/
Step    Variable    Removed        AIC           BIC           C(p)
----------------------------------------------------------------------
   1       x6       addition     18869.627     18885.434    18865.6270
   2       x1       addition     18571.376     18595.087    18565.3760
   3       x3       addition     18016.724     18048.338    18008.7240
   4       x2       addition     16642.374     16681.891    16632.3740
   5       x5       addition     16640.883     16688.304    16628.8830
   6       x6       removal      16639.219     16678.736    16629.2190
----------------------------------------------------------------------")

  expect_output(print(blr_step_p_both(model, details = TRUE)), x)

})
