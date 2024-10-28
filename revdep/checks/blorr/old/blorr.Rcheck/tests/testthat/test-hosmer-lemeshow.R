context("test-hosmer-lemeshow.R")

test_that("output from blr_hosmer_lemeshow_test is as expected", {
  model <- glm(
    honcomp ~ race + read + science, data = hsb2,
    family = binomial(link = "logit")
  )
  actual   <-  round(blr_test_hosmer_lemeshow(model)$pvalue, 2)
  expected <- 0.66
  expect_equal(actual, expected)
})


test_that("hosmer lemeshow test prints the correct output", {
  model <- glm(
    honcomp ~ race + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  k <- blr_test_hosmer_lemeshow(model)

  x <- cat(
    "           Partition for the Hosmer & Lemeshow Test
--------------------------------------------------------------
    def = 1                 def = 0
    Group    Total    Observed    Expected    Observed    Expected
    --------------------------------------------------------------
    1       20         0          0.16         20        19.84
    2       20         0          0.53         20        19.47
    3       20         2          0.99         18        19.01
    4       20         1          1.64         19        18.36
    5       21         3          2.72         18        18.28
    6       19         3          4.05         16        14.95
    7       20         7          6.50         13        13.50
    8       20         10         8.90         10        11.10
    9       20         13        11.49         7          8.51
    10       20         14        16.02         6          3.98
    --------------------------------------------------------------

    Goodness of Fit Test
    ------------------------------
    Chi-Square    DF    Pr > ChiSq
    ------------------------------
    4.4998      8       0.8095
    ------------------------------"
  )

  expect_output(print(k), x)
})
