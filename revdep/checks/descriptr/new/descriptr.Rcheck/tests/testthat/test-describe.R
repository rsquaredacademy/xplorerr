context("describe")

test_that("output from ds_tailobs match expected result", {
  expect_equivalent(ds_tailobs(mtcars$mpg, 5, "low"), c(10.4, 10.4, 13.3, 14.3, 14.7))
  expect_equivalent(ds_tailobs(mtcars$mpg, 5, "high"), c(33.9, 32.4, 30.4, 30.4, 27.3))
})


test_that("ds_tailobs returns the appropriate error", {
  expect_error(ds_tailobs(mtcars$mpg, 40, "low"), "n must be less than the length of data")
  expect_error(ds_tailobs(mtcars$mpg, 40, "high"), "n must be less than the length of data")
  expect_error(ds_tailobs("mtcars", 40, "high"), "data must be numeric")
  expect_error(ds_tailobs(as.factor(mtcars$disp), 40, "high"), "data must be numeric")
  expect_error(ds_tailobs(mtcars$mpg, "40", "high"), "n must be numeric")
})


test_that("output from ds_rindex match expected result", {
  expect_equivalent(ds_rindex(mtcars$mpg, c(13.3)), 24)
  expect_equivalent(ds_rindex(mtcars$mpg, c(33.9)), 20)
  expect_equivalent(ds_rindex(mtcars$mpg, c(13.3, 10.4)), c(24, 15, 16))
  expect_null(ds_rindex(mtcars$mpg, c(34)))
})


test_that("ds_rindex returns the appropriate error", {
  expect_error(ds_rindex("mtcars", c(13.3)), "data must be numeric")
  expect_error(ds_rindex(as.factor(mtcars$disp), c(13.3)), "data must be numeric")
  expect_error(ds_rindex(mtcars$mpg, "13.3"), "values must be numeric")
})


test_that("output from ds_skewness matches expected result", {
  expect_equal(round(ds_skewness(mtcars$mpg), 3), 0.672)
  expect_equal(round(ds_skewness(mpg, mtcars), 3), 0.672)
  expect_equal(round(ds_skewness(mtcars$disp), 3), 0.420)
  expect_equal(round(ds_skewness(mtcars$hp), 3), 0.799)
  expect_equal(round(ds_skewness(mtcars$drat), 3), 0.293)
  expect_equal(round(ds_skewness(mtcars$wt), 3), 0.466)
  expect_equal(round(ds_skewness(mtcars$qsec), 3), 0.406)
})


test_that("ds_skewness returns the appropriate error", {
  expect_error(round(ds_skewness("mtcars$mpg"), 3), "Skewness is calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(round(ds_skewness(as.factor(mtcars$mpg)), 3), "Skewness is calculated only for numeric data. The variable you have selected is of type factor.")
})


test_that("output from ds_kurtosis matches expected result", {
  expect_equal(round(ds_kurtosis(mtcars$mpg), 3), -0.022)
  expect_equal(round(ds_kurtosis(mpg, mtcars), 3), -0.022)
  expect_equal(round(ds_kurtosis(mtcars$disp), 3), -1.068)
  expect_equal(round(ds_kurtosis(mtcars$hp), 3), 0.275)
  expect_equal(round(ds_kurtosis(mtcars$drat), 3), -0.450)
  expect_equal(round(ds_kurtosis(mtcars$wt), 3), 0.417)
  expect_equal(round(ds_kurtosis(mtcars$qsec), 3), 0.865)
})


test_that("ds_kurtosis returns the appropriate error", {
  expect_error(round(ds_kurtosis("mtcars$mpg"), 3), "Kurtosis is calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(round(ds_kurtosis(as.factor(mtcars$mpg)), 3), "Kurtosis is calculated only for numeric data. The variable you have selected is of type factor.")
})


test_that("ds_css matches `Sum Sq` from anova", {
  expect_equal(round(ds_css(mtcars$mpg)), round(anova(lm(mpg ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mpg, mtcars)), round(anova(lm(mpg ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mtcars$disp)), round(anova(lm(disp ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mtcars$hp)), round(anova(lm(hp ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mtcars$drat)), round(anova(lm(drat ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mtcars$wt)), round(anova(lm(wt ~ 1, data = mtcars))[[2]]))
  expect_equal(round(ds_css(mtcars$qsec)), round(anova(lm(qsec ~ 1, data = mtcars))[[2]]))
})


test_that("ds_css returns the appropriate error", {
  expect_error(round(ds_css("mtcars$mpg")), "Corrected sum of squares can be calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(round(ds_css(as.factor(mtcars$mpg))), "Corrected sum of squares can be calculated only for numeric data. The variable you have selected is of type factor.")
})


test_that("output from ds_cvar matches the expected result", {
  expect_equal(round(ds_cvar(mtcars$mpg), 3), 29.999)
  expect_equal(round(ds_cvar(mpg, mtcars), 3), 29.999)
  expect_equal(round(ds_cvar(mtcars$disp), 3), 53.718)
})


test_that("ds_cvar returns the appropriate error", {
  expect_error(ds_cvar("mtcars$mpg"), "Coefficient of variation is calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(ds_cvar(as.factor(mtcars$mpg)), "Coefficient of variation is calculated only for numeric data. The variable you have selected is of type factor.")
})


test_that("output from ds_mode matches the expected result", {
  expect_equal(ds_mode(mtcars$mpg), 10.4)
  expect_equal(ds_mode(mtcars$disp), 275.8)
  expect_equal(ds_mode(mtcars$hp), 110)
  expect_equal(ds_mode(mtcars$drat), 3.07)
  expect_equal(ds_mode(mtcars$wt), 3.440)
  expect_equal(ds_mode(mtcars$qsec), 17.02)
})


test_that("ds_mode returns the appropriate error", {
  expect_error(ds_mode("mtcars$mpg"), "x must be numeric")
  expect_error(ds_mode(as.factor(mtcars$mpg)), "x must be numeric")
})


test_that("output from ds_range matches the expected result", {
  expect_equal(ds_range(mtcars$mpg), 23.5)
  expect_equal(ds_range(mpg, mtcars), 23.5)
  expect_equal(ds_range(mtcars$disp), 400.9)
  expect_equal(ds_range(mtcars$hp), 283)
  expect_equal(ds_range(mtcars$drat), 2.17)
  expect_equal(ds_range(mtcars$wt), 3.911)
  expect_equal(ds_range(mtcars$qsec), 8.40)
})


test_that("ds_range returns the appropriate error", {
  expect_error(ds_range("mtcars$mpg"), "Range can be calculated only for numeric data. The variable you have selected is character.")
  expect_error(ds_range(as.factor(mtcars$mpg)), "Range can be calculated only for numeric data. The variable you have selected is factor.")
})


test_that("output from ds_mdev matches the expected result", {
  expect_equal(round(ds_mdev(mtcars$mpg), 3), 4.714)
  expect_equal(round(ds_mdev(mpg, mtcars), 3), 4.714)
  expect_equal(round(ds_mdev(mtcars$disp), 3), 108.786)
  expect_equal(round(ds_mdev(mtcars$hp), 3), 56.48)
  expect_equal(round(ds_mdev(mtcars$drat), 3), 0.453)
  expect_equal(round(ds_mdev(mtcars$wt), 3), 0.73)
  expect_equal(round(ds_mdev(mtcars$qsec), 3), 1.376)
})


test_that("output from ds_mdev matches the expected result", {
  expect_equal(ds_mdev(c(92, 83, 88, 94, 91, 85, 89, 90)), 2.75)
  expect_equal(ds_mdev(c(3, 6, 6, 7, 8, 11, 15, 16)), 3.75)
})

test_that("ds_mdev returns the appropriate error", {
  expect_error(ds_mdev("mtcars$mpg"), "Mean absolute deviation is calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(ds_mdev(as.factor(mtcars$mpg)), "Mean absolute deviation is calculated only for numeric data. The variable you have selected is of type factor.")
})


test_that("output from ds_hmean matches the expected output", {
  expect_equal(round(ds_hmean(mtcars$mpg), 2), 18.44)
  expect_equal(round(ds_hmean(mpg, mtcars), 2), 18.44)
  expect_equal(round(ds_hmean(mtcars$disp), 2), 166.8)
  expect_equal(round(ds_hmean(mtcars$hp), 2), 118.23)
})

test_that("ds_hmean throws the appropriate error", {
  expect_error(ds_hmean("mtcars$mpg"), "Harmonic mean can be calculated only for numeric data. The variable you have selected is character.")
  expect_error(ds_hmean(as.factor(mtcars$mpg)), "Harmonic mean can be calculated only for numeric data. The variable you have selected is factor.")
})


test_that("output from ds_gmean matches the expected output", {
  expect_equal(round(ds_gmean(mtcars$mpg), 2), 19.25)
  expect_equal(round(ds_gmean(mpg, mtcars), 2), 19.25)
  expect_equal(round(ds_gmean(mtcars$disp), 2), 197.32)
  expect_equal(round(ds_gmean(mtcars$hp), 2), 131.88)
})


test_that("ds_gmean throws the appropriate error", {
  expect_error(ds_gmean("mtcars$mpg"), "Geometric mean can be calculated only for numeric data. The variable you have selected is of type character.")
  expect_error(ds_gmean(as.factor(mtcars$mpg)), "Geometric mean can be calculated only for numeric data. The variable you have selected is of type factor.")
})

test_that("output from ds_measures_location is as expected", {

  actual <- round(sum(ds_measures_location(mtcarz)[[2]]), 2)
  expected <- 422.16
  expect_equal(actual, expected)

})

test_that("output from ds_measures_location is as expected", {

  actual <- round(sum(ds_measures_location(mtcarz, mpg)[[2]]), 2)
  expected <- 20.09
  expect_equal(actual, expected)

})

test_that("ds_measures_location throws appropriate errors", {

  x <- 1:10
  expect_error(ds_measures_location(x), 'data must be a `data.frame` or `tibble`.')

})

test_that("ds_measures_location throws appropriate errors", {

  mt <- dplyr::select(mtcarz, cyl, gear, am)
  expect_error(ds_measures_location(mt), 'Data has no continuous variables.')

})

test_that("output from ds_measures_variation is as expected", {

  actual <- round(sum(ds_measures_variation(mtcarz)[[2]]), 2)
  expected <- 721.88
  expect_equal(actual, expected)

})

test_that("output from ds_measures_variation is as expected", {

  actual <- round(sum(ds_measures_variation(mtcarz, mpg)[[2]]), 2)
  expected <- 23.5
  expect_equal(actual, expected)

})

test_that("ds_measures_variation throws appropriate errors", {

  x <- 1:10
  expect_error(ds_measures_variation(x), 'data must be a `data.frame` or `tibble`.')

})

test_that("ds_measures_variation throws appropriate errors", {

  mt <- dplyr::select(mtcarz, cyl, gear, am)
  expect_error(ds_measures_variation(mt), 'Data has no continuous variables.')

})

test_that("output from ds_measures_symmetry is as expected", {

  actual <- round(sum(ds_measures_symmetry(mtcarz)[[2]]), 2)
  expected <- 3.06
  expect_equal(actual, expected)

})

test_that("output from ds_measures_symmetry is as expected", {

  actual <- round(sum(ds_measures_symmetry(mtcarz, mpg)[[2]]), 2)
  expected <- 0.67
  expect_equal(actual, expected)

})

test_that("ds_measures_symmetry throws appropriate errors", {

  x <- 1:10
  expect_error(ds_measures_symmetry(x), 'data must be a `data.frame` or `tibble`.')

})

test_that("ds_measures_symmetry throws appropriate errors", {

  mt <- dplyr::select(mtcarz, cyl, gear, am)
  expect_error(ds_measures_symmetry(mt), 'Data has no continuous variables.')

})

test_that("output from ds_percentiles is as expected", {

  actual <- round(sum(ds_percentiles(mtcarz)[[2]]), 2)
  expected <- 152.27
  expect_equal(actual, expected)

})

test_that("output from ds_percentiles is as expected", {

  actual <- round(sum(ds_percentiles(mtcarz, mpg)[[2]]), 2)
  expected <- 10.4
  expect_equal(actual, expected)

})

test_that("ds_percentiles throws appropriate errors", {

  x <- 1:10
  expect_error(ds_percentiles(x), 'data must be a `data.frame` or `tibble`.')

})

test_that("ds_percentiles throws appropriate errors", {

  mt <- dplyr::select(mtcarz, cyl, gear, am)
  expect_error(ds_percentiles(mt), 'Data has no continuous variables.')

})

test_that("output from ds_extreme_obs is as expected", {

  actual <- round(sum(ds_extreme_obs(mtcarz, mpg)[[2]]), 2)
  expected <- 217.5
  expect_equal(actual, expected)

})

test_that("ds_extreme_obs throws appropriate errors", {

  x <- 1:10
  expect_error(ds_extreme_obs(x), 'data must be a `data.frame` or `tibble`.')

})

test_that("ds_extreme_obs throws appropriate errors", {

  expect_error(ds_extreme_obs(mtcarz, cyl), 'cyl is not a continuous variable. The function expects an object of type `numeric` or `integer` but cyl is of type `factor`.')

})