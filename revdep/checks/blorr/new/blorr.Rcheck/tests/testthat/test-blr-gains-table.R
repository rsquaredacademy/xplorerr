context("test-blr-gains-table.R")

model <- glm(
  honcomp ~ female + read + science, data = hsb2,
  family = binomial(link = "logit")
)

test_that("output from blr_gains_table is as expected", {
  gtable   <- blr_gains_table(model, hsb2)
  sens     <- round(mean(gtable$gains_table$sensitivity), 2)
  spec     <- round(mean(gtable$gains_table$specificity), 2)
  accu     <- round(mean(gtable$gains_table$accuracy), 2)
  actual   <- c(sens, spec, accu)
  expected <- c(80.94, 54.35, 61.40)
  expect_equivalent(actual, expected)
})


