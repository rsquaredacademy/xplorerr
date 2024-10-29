context("test-normal")

test_that("vdist_normal_plot throws the appropriate errors", {
  expect_error(vdist_normal_plot("10", 0.5), "mean must be numeric.")
  expect_error(vdist_normal_plot(as.factor(10), 0.5), "mean must be numeric.")
  expect_error(vdist_normal_plot(10, "0.5"), "sd must be numeric.")
  expect_error(vdist_normal_plot(10, as.factor(0.5)), "sd must be numeric.")
  expect_error(vdist_normal_plot(10, -2), "sd must be a positive value.")
})

test_that("vdist_normal_prob throws the appropriate errors", {
  expect_error(vdist_normal_prob("0.95"), "perc must be numeric.")
  expect_error(vdist_normal_prob(TRUE), "perc must be numeric.")
  expect_error(vdist_normal_prob(0.95, "10", 0.5), "mean must be numeric.")
  expect_error(vdist_normal_prob(0.95, as.factor(10), 0.5), "mean must be numeric.")
  expect_error(vdist_normal_prob(0.95, 10, "0.5"), "sd must be numeric.")
  expect_error(vdist_normal_prob(0.95, 10, as.factor(0.5)), "sd must be numeric.")
  expect_error(vdist_normal_prob(0.95, 10, -2), "sd must be a positive value.")
  expect_error(vdist_normal_prob(c(-1.74, 1.83, 0.6)), "Please do not specify more than 2 percentile values.")
  expect_error(vdist_normal_prob(c(-1.74), type = 'both'), "Specify two percentile values.")
})

test_that("vdist_normal_perc throws the appropriate errors", {
  expect_error(vdist_normal_perc(1.5), "probs must be between 0 and 1 only.")
  expect_error(vdist_normal_perc("0.95"), "probs must be numeric.")
  expect_error(vdist_normal_perc(TRUE), "probs must be numeric.")
  expect_error(vdist_normal_perc(0.95, "10", 0.5), "mean must be numeric.")
  expect_error(vdist_normal_perc(0.95, as.factor(10), 0.5), "mean must be numeric.")
  expect_error(vdist_normal_perc(0.95, 10, "0.5"), "sd must be numeric.")
  expect_error(vdist_normal_perc(0.95, 10, as.factor(0.5)), "sd must be numeric.")
  expect_error(vdist_normal_perc(0.95, 10, -2), "sd must be a positive value.")
})




