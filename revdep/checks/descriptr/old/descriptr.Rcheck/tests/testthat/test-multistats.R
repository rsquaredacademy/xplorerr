context("multistats")

test_that("output from multistats is as expected", {
  actual <- ds_tidy_stats(mtcars, mpg, disp, hp) %>%
    dplyr::filter(vars == "disp") %>%
    dplyr::select(min)
  expected <- tibble::tibble(min = 71.1)
  expect_equal(actual, expected)
})
