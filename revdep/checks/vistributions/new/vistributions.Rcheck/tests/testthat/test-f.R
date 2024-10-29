context("test-f")

test_that("vdist_f_plot returns appropriate error messages", {
  expect_error(vdist_f_plot("3"), "num_df must be numeric.")

  expect_error(vdist_f_plot(as.factor(3)), "num_df must be numeric.")

  expect_error(vdist_f_plot(den_df = "3"), "den_df must be numeric.")

  expect_error(vdist_f_plot(den_df = as.factor(3)), "den_df must be numeric.")

  expect_error(vdist_f_plot(normal = 3), "normal must be a logical value.")

  expect_error(vdist_f_plot(normal = "3"), "normal must be a logical value.")
})

test_that("vdist_f_perc returns appropriate error messages", {
  expect_error(vdist_f_perc("0.95"), "probs must be numeric.")

  expect_error(vdist_f_perc(as.factor(1)), "probs must be numeric.")

  expect_error(vdist_f_perc(num_df = "3"), "num_df must be numeric.")

  expect_error(vdist_f_perc(num_df = as.factor(3)), "num_df must be numeric.")

  expect_error(vdist_f_perc(den_df = "3"), "den_df must be numeric.")

  expect_error(vdist_f_perc(den_df = as.factor(3)), "den_df must be numeric.")

  expect_error(vdist_f_perc(1.02), "probs must be between 0 and 1 only.")

})

test_that("vdist_f_prob returns appropriate error messages", {
  expect_error(vdist_f_prob("0.95", 3, 30), "perc must be numeric.")

  expect_error(vdist_f_prob(as.factor(1), 3, 30), "perc must be numeric.")

  expect_error(vdist_f_prob(0.95, num_df = "3", den_df = 30), "num_df must be numeric.")

  expect_error(vdist_f_prob(0.95, num_df = as.factor(3), den_df = 30), "num_df must be numeric.")

  expect_error(vdist_f_prob(0.95, 3, den_df = "3"), "den_df must be numeric.")

  expect_error(vdist_f_prob(0.95, 3, den_df = as.factor(3)), "den_df must be numeric.")
})
