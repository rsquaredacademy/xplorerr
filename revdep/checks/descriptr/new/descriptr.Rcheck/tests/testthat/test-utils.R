context("utils")

test_that("output from formatc matches the expected result", {
  expect_equal(formatc(3, 11), "     3     ")
  expect_equal(formatc("hello", 7), " hello ")
})


test_that("output from formatl matches the expected result", {
  expect_equal(formatl(3), "3.00                ")
  expect_equal(formatl("hello"), "hello               ")
})


test_that("output from formatr matches the expected result", {
  expect_equal(formatr(3, 10), "      3.00")
})


test_that("output from formats matches the expected result", {
  expect_equal(formats(), "    ")
})


test_that("output from formatnc matches the expected result", {
  expect_equal(formatnc(3, 10), "   3.00   ")
})


test_that("output from format_gap matches the expected result", {
  expect_equal(format_gap(3), c("", "", ""))
})


test_that("output from formatol matches the expected result", {
  expect_equal(formatol(3, 11), "     3     ")
  expect_equal(formatol("hello", 7), " hello ")
})


test_that("output from l matches the expected result", {
  expect_equal(l(deparse(substitute(mtcars$mpg))), "mpg")
  expect_equal(l(deparse(substitute(mpg))), "mpg")
  expect_equal(l(deparse(substitute(mtcars@mpg))), "mtcars@mpg")
})


test_that("output from percent matches the expected result", {
  expect_equal(percent(c(25, 50, 25), 100), c(25, 50, 25))
  expect_equal(percent(c(20, 50, 15), 85), c(23.53, 58.82, 17.65))
})


test_that("output from formata matches the expected result", {
  expect_equal(formata(3.6987, 2, 10), "   3.7    ")
})


test_that("output from formatas matches the expected result", {
  expect_equal(formatas(3.6987, 2, 10), "    3.6987")
})


test_that("output from formatter_freq matches the expected result", {
  expect_equal(formatter_freq(5), "      5      ")
})


test_that("output from row_pct matches the expected result", {
  m <- matrix(c(12, 23, 37, 21), nrow = 2)
  exptd <- matrix(c(0.245, 0.523, 0.755, 0.477), nrow = 2)
  expect_equivalent(round(row_pct(m, c(49, 44)), 3), exptd)
})


test_that("output from col_pct matches the expected result", {
  m <- matrix(c(12, 23, 37, 21), nrow = 2)
  exptd <- matrix(c(0.343, 0.657, 0.638, 0.362), nrow = 2)
  expect_equivalent(round(col_pct(m, c(35, 58)), 3), exptd)
})


test_that("output from formatter matches the expected result", {
  expect_equal(formatter(3), "            3")
})


test_that("output from fround matches the expected result", {
  expect_equal(fround(3.6895), "3.69")
})


test_that("output form xmm matches the expected result", {
  expect_equivalent(xmm(3, 2), c(-7, 13))
})

test_that("output from seql matches the expected result", {
  expect_equivalent(seql(3, 2), c(-7, -5, -3, -1, 1, 3, 5, 7, 9, 11, 13))
})

test_that("output form xmmp matches the expected result", {
  expect_equivalent(xmmp(3, 2, 3.5), c(-5, 11))
  expect_equivalent(xmmp(3, 2, 4.5), c(-6, 12))
})

test_that("output from seqlp matches the expected result", {
  expect_equivalent(seqlp(3, 2, 2.5), c(-5, -3, -1, 1, 3, 5, 7, 9, 11))
  expect_equivalent(seqlp(3, 2, 4.5), c(-6, -4, -2, 0, 2, 4, 6, 8, 10, 12))
})


test_that("output form xmn matches the expected result", {
  expect_equivalent(xmn(3, 2), c(-3, 9))
})

test_that("output from seqln matches the expected result", {
  expect_equivalent(seqln(3, 2), c(-3, -1, 1, 3, 5, 7, 9))
})



test_that("output from intervals matches expected result", {
  expect_equivalent(intervals(0:10, 4), c(0.0, 2.5, 5.0, 7.5, 10.0))
})


test_that("output from freq matches the expected result", {
  expect_equivalent(
    freq(mtcars$mpg, 4, intervals(mtcars$mpg, 4)),
    c(10, 13, 5, 4)
  )
})

test_that("output from stat_uss matches the expected result", {
  expect_equal(stat_uss(hsb$write), 574919)
})


test_that("output from div_by matches the expected result", {
  expect_equal(div_by(2), 0.5)
})

test_that("output from uss is as expected", {
  expect_equal(uss(4, 2), 4)
})