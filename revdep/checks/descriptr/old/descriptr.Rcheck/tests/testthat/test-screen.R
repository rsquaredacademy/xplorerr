context("ds_screener")

test_that("output from ds_screener matches the expected result", {
  mt <- mtcars
  mt[, c(2, 8:11)] <- lapply(mt[, c(2, 8:11)], factor)
  mt[sample(1:nrow(mt), 12), c(2, 4, 7:10)] <- NA
  k <- ds_screener(mt)

  expect_equal(k$Rows, nrow(mt))
  expect_equal(k$Columns, ncol(mt))
  expect_equivalent(k$Variables, names(mt))
  expect_equivalent(k$Types, c(
    "numeric", "factor", "numeric", "numeric",
    "numeric", "numeric", "numeric",
    "factor", "factor", "factor", "factor"
  ))
  expect_equal(unname(k$Count), rep(32, 11))
  expect_equivalent(k$nlevels, list(
    mpg = 0, cyl = 3, disp = 0, hp = 0,
    drat = 0, wt = 0, qsec = 0, vs = 2,
    am = 2, gear = 3, carb = 6
  ))
  expect_equivalent(k$levels, list(
    mpg = NA, cyl = c("4", "6", "8"),
    disp = NA, hp = NA, drat = NA, wt = NA,
    qsec = NA, vs = c("0", "1"),
    am = c("0", "1"), gear = c("3", "4", "5"),
    carb = c("1", "2", "3", "4", "6", "8")
  ))
  expect_equivalent(k$Missing, c(
    mpg = 0, cyl = 12, disp = 0, hp = 12,
    drat = 0, wt = 0, qsec = 12, vs = 12,
    am = 12, gear = 12, carb = 0
  ))
  expect_equivalent(k$MissingPer, c(
    mpg = 0, cyl = 37.5, disp = 0, hp = 37.5,
    drat = 0, wt = 0, qsec = 37.5, vs = 37.5,
    am = 37.5, gear = 37.5, carb = 0
  ))
  expect_equal(k$MissingTotal, 72)
  expect_equal(k$MissingTotPer, 20.45)
  expect_equal(k$MissingRows, 12)
  expect_equal(k$MissingCols, 6)
})


test_that("ds_screener throws the appropriate error", {
  expect_error(ds_screener(mtcars$mpg), "data must be a `data.frame` or `tibble`.")
})
