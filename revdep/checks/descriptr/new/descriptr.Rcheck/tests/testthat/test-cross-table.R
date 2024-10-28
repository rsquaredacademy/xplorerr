context("ds_cross_table")

test_that("output from ds_cross_table matches expected results", {
  k <- ds_cross_table(hsb, ses, female)

  expect_equal(k$obs, 200)

  expect_equivalent(k$var2_levels, c("0", "1"))

  expect_equivalent(k$var1_levels, c("1", "2", "3"))

  expect_equivalent(k$varnames, c("ses", "female"))

  expect_equivalent(k$twowaytable[, 1], c("1", "2", "3"))

  expect_equivalent(k$twowaytable[, 2], c("15", "47", "29"))

  expect_equivalent(k$twowaytable[, 3], c("32", "48", "29"))

  expect_equivalent(k$twowaytable[, 4], c("47", "95", "58"))

  expect_equivalent(colnames(k$twowaytable), c("", "0", "1", "rowtotal"))

  expect_equivalent(k$percent_table[, 1], c(0.075, 0.235, 0.145, 0.455))

  expect_equivalent(k$percent_table[, 2], c(0.160, 0.240, 0.145, 0.545))

  expect_equivalent(k$percent_table[, 3], c(0.235, 0.475, 0.290, 1.000))

  expect_equivalent(colnames(k$percent_table), c("0", "1", "row_pct"))

  expect_equivalent(rownames(k$percent_table), c("", "", "", "col_pct"))

  expect_equivalent(k$row_percent[, 1], c(0.32, 0.49, 0.50))

  expect_equivalent(k$row_percent[, 2], c(0.68, 0.51, 0.50))

  expect_equivalent(k$row_percent[3, 3], c(0.29))

  expect_equivalent(k$column_percent[, 1], c(0.16, 0.52, 0.32))

  expect_equivalent(k$column_percent[, 2], c(0.29, 0.44, 0.27))

  expect_equivalent(unname(k$column_totals), c(91, 109))

  expect_equivalent(unname(k$percent_column), c(0.455, 0.545))
})


test_that("ouput from plot.ds_cross_table matches expected output", {
  skip_on_cran()

  # cross table
  k <- ds_cross_table(mtcarz, cyl, gear)

  # bar plot
  p1 <- plot(k)
  expect_doppelganger("cross_bar", p1$plot)

  # stacked bar plot
  p2 <- plot(k, stacked = TRUE)
  expect_doppelganger("cross_bar_stacked", p2$plot)

  # proportional bar plot
  p3 <- plot(k, proportional = TRUE)
  expect_doppelganger("cross_bar_proportional", p3$plot)
})

test_that("ds_cross_table throws appropriate error", {

  x <- 1:10
  expect_error(ds_cross_table(x), 'data must be a `data.frame` or `tibble`.')
  expect_error(ds_cross_table(mtcarz, mpg, cyl), 'mpg is not a categorical variable. The function expects an object of type `factor` but mpg is of type `numeric`.')
  expect_error(ds_cross_table(mtcarz, cyl, disp), 'disp is not a categorical variable. The function expects an object of type `factor` but disp is of type `numeric`.')

})

test_that("output from ds_twoway_table is as expected", {
  actual <- sum(ds_twoway_table(mtcarz, cyl, gear)[[3]])
  expected <- 32
  expect_equal(actual, expected)
})

test_that("ds_twoway_table throws appropriate error", {

  x <- 1:10
  expect_error(ds_twoway_table(x), 'data must be a `data.frame` or `tibble`.')
  expect_error(ds_twoway_table(mtcarz, mpg, cyl), 'mpg is not a categorical variable. The function expects an object of type `factor` but mpg is of type `numeric`.')
  expect_error(ds_twoway_table(mtcarz, cyl, disp), 'disp is not a categorical variable. The function expects an object of type `factor` but disp is of type `numeric`.')

})
