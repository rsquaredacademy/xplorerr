context("test-group-summary-interact")

test_that("output from ds_group_summary_interact is as expected", {
  actual <-
    ds_group_summary_interact(mtcarz, mpg, cyl, gear) %>%
    dplyr::select(min) %>%
    sum() %>%
    round(2)
  expect_equal(actual, 149.9)
})

test_that("ds_group_summary_interact throws the appropriate error", {

  expect_error(
    ds_group_summary_interact(mtcarz, am, cyl, gear),
    "am is not a continuous variable. The function expects an object of type `numeric` or `integer` but am is of type `factor`."
  )

  expect_error(
    ds_group_summary_interact(mtcarz, mpg, cyl, disp, hp),
    "Below grouping variables are not categorical: 
- disp
- hp"
  )

  expect_error(
    ds_group_summary_interact(mtcarz, mpg, cyl, hp),
    "Below grouping variables are not categorical: 
- hp"
  )
})
