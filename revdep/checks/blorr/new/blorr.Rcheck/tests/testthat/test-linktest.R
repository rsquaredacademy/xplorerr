context("test-linktest.R")

test_that("output from blr_linktest is as expected", {

   model <- glm(
    honcomp ~ female + read + science, data = hsb2,
    family = binomial(link = "logit")
  )

  actual   <- round(unname(blr_linktest(model)$coefficients[, 1]), 2)
  expected <- c(0.04, 0.94, -0.04)
  expect_equivalent(actual, expected)
})
