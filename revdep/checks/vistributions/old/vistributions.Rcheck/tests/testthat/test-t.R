context("test-t")

test_that("vdist_t_plot throws the appropriate errors", {
  expect_error(vdist_t_plot("10"), "df must be numeric.")
  expect_error(vdist_t_plot(TRUE), "df must be numeric.")
})

test_that("vdist_t_prob throws the appropriate errors", {
  expect_error(vdist_t_prob("0.95", df = 10), "perc must be numeric.")
  expect_error(vdist_t_prob(TRUE, df = 10), "perc must be numeric.")
  expect_error(vdist_t_prob(0.95, "10"), "df must be numeric.")
  expect_error(vdist_t_prob(0.95, TRUE), "df must be numeric.")
})

test_that("vdist_t_perc throws the appropriate errors", {
  expect_error(vdist_t_perc(1.5), "probs must be between 0 and 1 only.")
  expect_error(vdist_t_perc("0.95"), "probs must be numeric.")
  expect_error(vdist_t_perc(TRUE), "probs must be numeric.")
  expect_error(vdist_t_perc(0.95, "10"), "df must be numeric.")
  expect_error(vdist_t_perc(0.95, TRUE), "df must be numeric.")
})




