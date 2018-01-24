source('helpers/utils.R')
source('helpers/output.R')

blr_lr_test <- function(full_model, reduced_model) UseMethod('blr_lr_test')

blr_lr_test.default <- function(full_model, reduced_model) {

  # create intercept only model
  if (missing(reduced_model)) {

    dep <- response_var(full_model)

    dat <- full_model %>%
      use_series(data) 
      
    reduced_model <- glm(glue(dep, ' ~ 1'), data = dat,
        family = binomial(link = 'logit'))

  }

  

  # -2 log likelihood
  full_model_ll <- mll(full_model)
  reduced_model_ll <- mll(reduced_model)

  # likelihood ratio, df and p value
  lr <- reduced_model_ll - full_model_ll

  df <- full_model %>%
    coefficients %>%
    length %>%
    subtract(1)

  pval <- pchisq(q = lr, df = df, lower.tail = FALSE)

  # model formula
  full_model_formula <- full_model %>%
    use_series(formula)
  reduced_model_formula <- reduced_model %>%
    use_series(formula)

  # dfs
  full_model_df <- model_d_f(full_model)
  reduced_model_df <- model_d_f(reduced_model)

  # output
  model_info <- tibble(
    model = c('full model', 'reduced model'),
    formulas = c(full_model = full_model_formula,
                 reduced_model = reduced_model_formula),
    log_lik = c(full_model_ll, reduced_model_ll),
    d_f = c(full_model_df, reduced_model_df)
  )

  test_info <- tibble(
    lr_ratio = lr,
    d_f = df,
    p_value = pval
  )

  result <- list(model_info = model_info, test_result = test_info)
  class(result) <- 'blr_lr_test'
  return(result)

}

print.blr_lr_test <- function(x, ...) {

  print_blr_lr_test(x)

}
