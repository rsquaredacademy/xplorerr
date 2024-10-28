context("test-utils.R")

# regression
model <- glm(
  honcomp ~ female + read + science, data = hsb2,
  family = binomial(link = "logit")
)

test_that("response_var extract response variable name from the model", {
  actual <- response_var(model)
  expected <- model$terms[[2]]
  expect_equal(actual, expected)
})

test_that("data_name extracts name of the data set from the model", {
  actual <- data_name(model)
  expected <- model$call[[4]]
  expect_equal(actual, expected)
})


test_that("data_nrows returns the number of observations in the data set", {
  actual <- data_nrows(model)
  expected <- 200
  expect_equal(actual, expected)
})

test_that("converge_status returns the model convergence status", {
  actual <- converge_status(model)
  expect_true(actual)
})

test_that("residual_df returns the residual degrees of freedom", {
  actual <- residual_df(model)
  expected <- 196
  expect_equal(actual, expected)
})

test_that("model_df returns the model degrees of freedom", {
  actual <- model_df(model)
  expected <- 199
  expect_equal(actual, expected)
})

test_that("output from resp_profile is as expected", {
  actual <- resp_profile(model)[[1]]
  expected <- 147
  expect_equal(actual, expected)
})


test_that("predictor_names returns names of the predictors", {
  actual <- predictor_names(model)
  expected <- c("(Intercept)", "female1", "read", "science")
  expect_equivalent(actual, expected)
})


test_that("output from model_df is as expected", {
  actual <- predictor_df(model)
  expected <- c(1, 1, 1, 1)
  expect_equivalent(actual, expected)
})

test_that("output from predictor_est is as expected", {
  actual <- round(predictor_est(model), 2)
  expected <- c(-12.78, 1.48, 0.10, 0.09)
  expect_equivalent(actual, expected)
})

test_that("output from predictor_se is as expected", {
  actual <- round(predictor_se(model), 2)
  expected <- c(1.98, 0.45, 0.03, 0.03)
  expect_equivalent(actual, expected)
})

test_that("output from predictor_zval is as expected", {
  actual <- round(predictor_zval(model), 2)
  expected <- c(-6.47, 3.31, 4.02, 3.11)
  expect_equivalent(actual, expected)
})

test_that("output from predictor_pval is as expected", {
  actual <- round(predictor_pval(model), 5)
  expected <- c(0.00000, 0.00092, 0.00006, 0.00185)
  expect_equivalent(actual, expected)
})


test_that("output from odds_effect is as expected", {
  actual <- odds_effect(model)
  expected <- c("female1", "read", "science")
  expect_equivalent(actual, expected)
})

test_that("output from odds_point is as expected", {
  actual <- round(odds_point(model), 2)
  expected <- c(4.40, 1.11, 1.10)
  expect_equivalent(actual, expected)
})

test_that("output from mll is as expected", {
  actual <- round(mll(model), 4)
  expected <- 160.2364
  expect_equivalent(actual, expected)
})

test_that("output from model_class is as expected", {
  actual <- model_class(model)
  expected <- "glm"
  expect_equal(actual, expected)
})

test_that("output from model_d_f is as expected", {
  actual <- model_d_f(model)
  expected <- 4
  expect_equal(actual, expected)
})

test_that("output from extract_ll is as expected", {
  actual <- round(extract_ll(model), 4)
  expected <- 160.2364
  expect_equivalent(actual, expected)
})
