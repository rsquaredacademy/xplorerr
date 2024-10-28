context("test-coll-diag.R")

test_that("output from blr_vif_tol is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  actual   <- round(blr_vif_tol(model)[['VIF']], 2)
  expected <- c(1.02, 1.66, 1.68)

  expect_equivalent(actual, expected)
})

test_that("output from blr_eigen_cindex is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  actual   <- round(blr_eigen_cindex(model)[['Eigenvalue']], 2)
  expected <- c(3.57, 0.39, 0.02, 0.01)

  expect_equivalent(actual, expected)
})

test_that("blr_coll_diag prints the correct output", {
  model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  k <- blr_coll_diag(model)

  x <- cat(
    "Tolerance and Variance Inflation Factor
---------------------------------------
  Variable Tolerance      VIF
1  female1 0.9824347 1.017879
2     read 0.6021370 1.660752
3  science 0.5939847 1.683545


Eigenvalue and Condition Index
------------------------------
  Eigenvalue Condition Index    intercept      female1         read      science
1 3.57391760        1.000000 3.500782e-06 2.232611e-05 0.0006577134 0.0009448623
2 0.39409893        3.011408 5.155657e-06 8.559696e-04 0.0015266309 0.0025603607
3 0.01888407       13.757025 1.632498e-03 4.397949e-05 0.1143698337 0.0545537252
4 0.01309940       16.517583 5.619292e-05 1.312420e-05 0.2758987745 0.5468553525"
  )

  expect_output(print(k), x)
})
