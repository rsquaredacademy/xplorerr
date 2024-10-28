context("test-gini-index.R")

test_that("output from blr_gini_index is as expected", {
  model <- glm(
    honcomp ~ female + read + science, data = blorr::hsb2,
    family = binomial(link = "logit")
  )

  actual <- blr_gini_index(model)
  expected <- ineq::Gini(model$fitted.values)
  expect_equal(actual, expected)
})
