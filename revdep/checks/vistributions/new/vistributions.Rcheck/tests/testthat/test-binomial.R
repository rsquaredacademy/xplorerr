context("test-binomial")

test_that("vdist_binom_plot throws the appropriate errors", {
  expect_error(vdist_binom_plot(10, -0.5), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_plot(10, 1.5), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_plot("10", 0.5), "n must be numeric.")
  expect_error(vdist_binom_plot(as.factor(10), 0.5), "n must be numeric.")
  expect_error(vdist_binom_plot(10, "0.5"), "p must be numeric.")
  expect_error(vdist_binom_plot(10, as.factor(0.5)), "p must be numeric.")
})

test_that("vdist_binom_prob throws the appropriate errors", {
  expect_error(vdist_binom_prob(10, -0.5, 4), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_prob(10, 1.5, 4), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_prob(10, "0.5", 4), "p must be numeric.")
  expect_error(vdist_binom_prob("10", 0.5, 4), "n must be numeric.")
  expect_error(vdist_binom_prob(as.factor(10), 0.5, 4), "n must be numeric.")
  expect_error(vdist_binom_prob(10, 0.5, "4"), "s must be numeric.")
  expect_error(vdist_binom_prob(10, 0.5, as.factor(4)), "s must be numeric.")
  expect_error(vdist_binom_prob(10, 0.3, 4, type = 'interval'), "Please specify an interval for s.")
  expect_error(vdist_binom_prob(3, 0.3, 4), "s must be less than or equal to n.")
})

test_that("vdist_binom_perc throws the appropriate errors", {
  expect_error(vdist_binom_perc(10, -0.5, 0.05), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_perc(10, 1.5, 0.05), "p must be between 0 and 1 only.")
  expect_error(vdist_binom_perc(10, 0.5, -0.05), "tp must be between 0 and 0.5 only.")
  expect_error(vdist_binom_perc(10, 0.5, 0.51), "tp must be between 0 and 0.5 only.")
  expect_error(vdist_binom_perc("10", 0.5, 0.05), "n must be numeric.")
  expect_error(vdist_binom_perc(as.factor(10), 0.5, 0.05), "n must be numeric.")
  expect_error(vdist_binom_perc(10, "0.5", 0.05), "p must be numeric.")
  expect_error(vdist_binom_perc(10, as.factor(0.5), 0.05), "p must be numeric.")
  expect_error(vdist_binom_perc(10, 0.5, "0.05"), "tp must be numeric.")
  expect_error(vdist_binom_perc(10, 0.5, as.factor(0.05)), "tp must be numeric.")
})





