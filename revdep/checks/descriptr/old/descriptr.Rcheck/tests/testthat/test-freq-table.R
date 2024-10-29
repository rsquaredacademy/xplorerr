context("freq_table")

test_that("output from ds_freq_table matches expected results", {
  k <- ds_freq_table(mtcarz, cyl)
  expect_equivalent(k$ftable[[1]], c("4", "6", "8"))
  expect_equivalent(k$ftable[[2]], c(11, 7, 14))
  expect_equivalent(k$ftable[[3]], c(11, 18, 32))
  expect_equivalent(k$ftable[[4]][-2], c(34.38, 43.75))
  expect_equivalent(k$ftable[[5]], c(34.38, 56.25, 100.00))
  expect_equivalent(k$varname, "cyl")
})


test_that("output from ds_freq_table plot is as expected", {
  skip_on_cran()

  k <- ds_freq_table(mtcarz, cyl)
  p <- plot(k)
  expect_doppelganger("ds_freq_bar", p$plot)
})

test_that("output from ds_freq_cont matches expected result", {
  k <- ds_freq_table(mtcars, mpg, bins = 4)
  expect_equivalent(k$breaks, c(10.400, 16.275, 22.150, 28.025, 33.900))
  expect_equivalent(k$frequency, c(10, 13, 5, 4))
  expect_equivalent(k$cumulative, c(10, 23, 28, 32))
  expect_equivalent(k$percent[-c(2, 3)], c(31.25, 12.50))
  expect_equivalent(k$cum_percent[-2], c(31.25, 87.50, 100.00))
  expect_equal(k$bins, 4)
  expect_equal(k$data, mtcars$mpg)
  expect_equivalent(k$varname, "mpg")
})

test_that("output from ds_freq_table plot is as expected", {
  skip_on_cran()

  k <- ds_freq_table(mtcarz, mpg)
  p <- plot(k)
  expect_doppelganger("ds_freq_cont", p$plot)
})
