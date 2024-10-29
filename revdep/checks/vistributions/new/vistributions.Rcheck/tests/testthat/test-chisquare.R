context("test-chisquare")

test_that("vdist_chi_plot returns appropriate error messages", {
  expect_error(vdist_chisquare_plot("3"), "df must be numeric.")

  expect_error(vdist_chisquare_plot(as.factor(3)), "df must be numeric.")

  expect_error(vdist_chisquare_plot(normal = 3), "normal must be a logical value.")

  expect_error(vdist_chisquare_plot(normal = "3"), "normal must be a logical value.")
})

test_that("vdist_chisquare_perc returns appropriate error messages", {
  expect_error(vdist_chisquare_perc("0.95"), "probs must be numeric.")

  expect_error(vdist_chisquare_perc(as.factor(1)), "probs must be numeric.")

  expect_error(vdist_chisquare_perc(df = "3"), "df must be numeric.")

  expect_error(vdist_chisquare_perc(df = as.factor(3)), "df must be numeric.")
})

test_that("vdist_chisquare_prob returns appropriate error messages", {
  expect_error(vdist_chisquare_prob("0.95", df = 3), "perc must be numeric.")

  expect_error(vdist_chisquare_prob(as.factor(1), df = 3), "perc must be numeric.")

  expect_error(vdist_chisquare_prob(df = "3"), "df must be numeric.")

  expect_error(vdist_chisquare_prob(df = as.factor(3)), "df must be numeric.")
})
