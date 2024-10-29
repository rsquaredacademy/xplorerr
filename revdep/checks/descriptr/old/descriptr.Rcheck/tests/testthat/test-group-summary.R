context("ds_group_summary")

test_that("output from ds_group_summary matches the expected result", {
  mt <- mtcars
  mt$cyl <- as.factor(mt$cyl)
  k <- ds_group_summary(mt, cyl, mpg)
  metrics <- c(
    "Obs", "Minimum", "Maximum", "Mean", "Median", "Mode",
    "Std. Deviation", "Variance", "Skewness", "Kurtosis",
    "Uncorrected SS", "Corrected SS", "Coeff Variation",
    "Std. Error Mean", "Range", "Interquartile Range"
  )

  expect_equal(k$xvar, "cyl")
  expect_equal(k$yvar, "mpg")
  expect_equivalent(as.character(k$stats[, 1]), metrics)
  expect_equivalent(k$stats[, 2], c(
    11.00, 21.40, 33.90, 26.66, 26.00, 22.80,
    4.51, 20.34, 0.35, -1.43, 8023.83, 203.39,
    16.91, 1.36, 12.50, 7.60
  ))
  expect_equivalent(k$stats[, 3], c(
    7.00, 17.80, 21.40, 19.74, 19.70, 21.00,
    1.45, 2.11, -0.26, -1.83, 2741.14, 12.68,
    7.36, 0.55, 3.60, 2.35
  ))
  expect_equivalent(k$stats[, 4], c(
    14.00, 10.40, 19.20, 15.10, 15.20, 10.40,
    2.56, 6.55, -0.46, 0.33, 3277.34, 85.20,
    16.95, 0.68, 8.80, 1.85
  ))
})


test_that("ds_group_summary throws the appropriate error", {
  mt <- mtcars
  mt$cyl <- as.factor(mt$cyl)
  mt$am <- as.factor(mt$am)

  expect_error(
    ds_group_summary(mtcars, gear, mpg),
    "gear is not a categorical variable. The function expects an object of type `factor` but gear is of type `numeric`."
  )
  expect_error(
    ds_group_summary(mt, cyl, am),
    "am is not a continuous variable. The function expects an object of type `numeric` or `integer` but am is of type `factor`."
  )
})


test_that("output from ds_group_summary plot is as expected", {
  skip_on_cran()

  k <- ds_group_summary(mtcarz, cyl, mpg)
  p <- plot(k)
  expect_doppelganger("group_summary", p$plot)
})


