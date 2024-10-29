context("test-summary-stats")

test_that("output from ds_summary is as expected", {
  
  actual <- round(ds_summary(mtcarz, mpg)$variance, 2)
	expected <- 36.32
	expect_equal(actual, expected)

})

test_that("ds_summary_stats throws appropriate errors", {
  fdata <- dplyr::select(mtcarz, cyl, gear, am, vs)
  expect_error(ds_summary_stats(fdata), 'Data has no continuous variables.')
  expect_error(ds_summary_stats(mtcarz, cyl, gear), 'Data has no continuous variables.')
})