context("test-model-fit-stats.R")

# regression
model <- glm(
  honcomp ~ female + read + science, data = hsb2,
  family = binomial(link = "logit")
)

test_that("model_deviance returns deviance", {
  actual   <- round(model_deviance(model), 4)
  expected <- 160.2364
  expect_equal(actual, expected)
})

test_that("null_ll returns log likelihood of intercept only model", {
  model <- glm(
    vs ~ cyl + disp + hp, data = mtcars,
    family = binomial(link = "logit")
  )
  actual   <- round(null_ll(model), 3)
  expected <- -21.93
  expect_equal(actual, expected)
})

test_that("model_ll returns full model log likelihood", {
  actual   <- round(model_ll(model), 3)
  expected <- -80.118
  expect_equal(actual, expected)
})

test_that("output from model_aic is as expected", {
  actual   <- round(model_aic(model), 4)
  expected <- 168.2364
  expect_equal(actual, expected)
})

test_that("output from model_bic is as expected", {
  actual   <- round(model_bic(model), 4)
  expected <- 181.4296
  expect_equal(actual, expected)
})

test_that("output from blr_mcfadden_rsq is as expected", {
  actual   <- round(blr_rsq_mcfadden(model), 4)
  expected <- 0.3072
  expect_equal(actual, expected)
})

test_that("output from blr_mcfadden_adj_rsq is as expected", {
  actual   <- round(blr_rsq_mcfadden_adj(model), 4)
  expected <- 0.2726
  expect_equal(actual, expected)
})

test_that("output from blr_cox_snell_rsq is as expected", {
  actual   <- round(blr_rsq_cox_snell(model), 4)
  expected <- 0.299
  expect_equal(actual, expected)
})


test_that("output from blr_nagelkerke_rsq is as expected", {
  actual   <- round(blr_rsq_nagelkerke(model), 4)
  expected <- 0.4363
  expect_equal(actual, expected)
})

test_that("output from blr_mckelvey_zavoina_rsq is as expected", {
  actual   <- round(blr_rsq_mckelvey_zavoina(model), 4)
  expected <- 0.5178
  expect_equal(actual, expected)
})

test_that("output from blr_count_rsq is as expected", {
  actual   <- round(blr_rsq_count(model), 4)
  expected <- 0.81
  expect_equal(actual, expected)
})

test_that("output from blr_adj_count_rsq is as expected", {
  actual   <- round(blr_rsq_adj_count(model), 4)
  expected <- 0.283
  expect_equal(actual, expected)
})

test_that("output from blr_effron_rsq is as expected", {
  actual   <- round(blr_rsq_effron(model), 4)
  expected <- 0.3305
  expect_equal(actual, expected)
})



test_that("blr_model_fit_stats prints the correct output", {
  k <- blr_model_fit_stats(model)

  x <- cat(
    "                              Model Fit Statistics
---------------------------------------------------------------------------------
    Log-Lik Intercept Only:      -115.644    Log-Lik Full Model:              -80.118
    Deviance(196):                160.236    LR(3):                            71.052
    Prob > LR:                         0.000
    MCFadden's R2                   0.307    McFadden's Adj R2:                 0.273
    ML (Cox-Snell) R2:              0.299    Cragg-Uhler(Nagelkerke) R2:        0.436
    McKelvey & Zavoina's R2:        0.518    Efron's R2:                        0.330
    Count R2:                       0.810    Adj Count R2:                      0.283
    BIC:                          181.430    AIC:                             168.236
    ---------------------------------------------------------------------------------"
  )

  expect_output(print(k), x)
})

test_that("blr_multi_model_fit_stats prints the correct output", {
  model1 <- glm(
    honcomp ~ prog + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  k <- blr_multi_model_fit_stats(model, model1)

  x <- cat(
    "                      Measures  Model 1  Model 2
1       Log-Lik Intercept Only -115.644 -115.644
    2          Log-Lik Full Model:  -80.118  -84.570
    3                     Deviance  160.236  169.141
    4                           LR   71.052   62.148
    5                   Prob > LR:    0.000    0.000
    6                MCFadden's R2    0.307    0.269
    7           McFadden's Adj R2:    0.273    0.225
    8           ML (Cox-Snell) R2:    0.299    0.267
    9  Cragg-Uhler(Nagelkerke) R2:    0.436    0.390
    10    McKelvey & Zavoina's R2:    0.518    0.440
    11                 Efron's R2:    0.330    0.281
    12                   Count R2:    0.810    0.785
    13               Adj Count R2:    0.283    0.189
    14                        AIC:  168.236  179.141
    15                        BIC:  181.430  195.632"
  )

  expect_output(print(k), x)
})


test_that("blr_lr_test prints the correct output", {
  k <- blr_test_lr(model)

  x <- cat(
    "    Likelihood Ratio Test
------------------------------
    Chi-Square    DF    Pr > ChiSq
    ------------------------------
    71.0525      3       0.0000
    ------------------------------"
  )

  expect_output(print(k), x)
})
