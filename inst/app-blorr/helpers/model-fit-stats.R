source('helpers/utils.R')
source('helpers/output.R')
source('helpers/lrtest.R')

blr_model_fit_stats <- function(model, ...) UseMethod('blr_model_fit_stats')

blr_model_fit_stats.default <- function(model, ...) {

  lr <- blr_lr_test(model)
  n <- model %>%
    use_series(y) %>%
    length

  result <- list(
    loglik_null = null_ll(model),
    loglik_model = model_ll(model),
    m_deviance = model_deviance(model),
    lr_ratio = lr %>%
      use_series(test_result) %>%
      pull(lr_ratio),
    lr_df = lr %>%
      use_series(test_result) %>%
      pull(d_f),
    lr_pval = lr %>%
      use_series(test_result) %>%
      pull(p_value),
    mcfadden = blr_mcfadden_rsq(model),
    adj_mcfadden = blr_mcfadden_adj_rsq(model),
    cox_snell = blr_cox_snell_rsq(model),
    nagelkerke = blr_nagelkerke_rsq(model),
    mckelvey = blr_mckelvey_zavoina_rsq(model),
    effron = blr_effron_rsq(model),
    count_r2 = blr_count_rsq(model),
    count_adj = blr_adj_count_rsq(model),
    m_aic = model_aic(model),
    m_bic = model_bic(model),
    dev_df = n %>%
      subtract(model %>%
                 coefficients %>%
                 length)
  )

  class(result) <- 'blr_model_fit_stats'
  return(result)

}

print.blr_model_fit_stats <- function(x, ...) {
  print_model_fit_stats(x)
}

model_deviance <- function(model) {

  model %>%
    use_series(deviance)

}


null_ll <- function(model) {

  i_model(model) %>%
    logLik %>%
    `[[`(1)

}


model_ll <- function(model) {

  model %>%
    logLik %>%
    `[`(1)

}


model_aic <- function(model) {

  model %>%
    AIC

}


model_bic <- function(model) {

  model %>%
    BIC

}

blr_mcfadden_rsq <- function(model) {

  f_model_ll <- model %>%
    model_ll

  i_model_ll <- model %>%
    i_model %>%
    model_ll

  1 %>%
    subtract(f_model_ll %>%
               divide_by(i_model_ll))

}

blr_mcfadden_adj_rsq <- function(model) {

  f_model_ll <- model %>%
    model_ll

  i_model_ll <- model %>%
    i_model %>%
    model_ll

  k <- model %>%
    model_d_f

  1 %>%
    subtract((f_model_ll - k) %>%
               divide_by(i_model_ll))

}

blr_cox_snell_rsq <- function(model) {

  f_model_ll <- model %>%
    model_ll %>%
    exp

  i_model_ll <- model %>%
    i_model %>%
    model_ll %>%
    exp

  n <- model %>%
    use_series(data) %>%
    nrow

  ratio <- i_model_ll %>%
    divide_by(f_model_ll)

  pow <- 2 %>%
    divide_by(n)

  ratio_pow <- ratio %>%
    raise_to_power(pow)

  1 %>%
    subtract(ratio_pow)

}


blr_nagelkerke_rsq <- function(model) {

  cox_snell <- blr_cox_snell_rsq(model)

  i_model_ll <- model %>%
    i_model %>%
    model_ll %>%
    exp

  n <- model %>%
    use_series(data) %>%
    nrow

  pow <- 2 %>%
    divide_by(n)

  den <- 1 %>%
    subtract(i_model_ll %>%
    raise_to_power(pow))

  cox_snell %>%
    divide_by(den)

}

blr_mckelvey_zavoina_rsq <- function(model) {

  predicted <- model %>%
    predict

  mean_predicted <- predicted %>%
    mean

  ess <- predicted %>%
    subtract(mean_predicted) %>%
    raise_to_power(2) %>%
    sum

  pi_val <- pi %>%
    raise_to_power(2) %>%
    divide_by(3)

  n <- model %>%
    use_series(y) %>%
    length

  ess %>%
    divide_by((n %>%
                multiply_by(pi_val)) %>%
                add(ess))

}


blr_effron_rsq <- function(model) {

  predicted <- model %>%
    predict(type = 'response')

  resp <- model %>%
    use_series(y)

  num <- resp %>%
    subtract(predicted) %>%
    raise_to_power(2) %>%
    sum

  mean_resp <- resp %>%
    mean

  den <- resp %>%
    subtract(mean_resp) %>%
    raise_to_power(2) %>%
    sum

  1 %>%
    subtract(num %>%
               divide_by(den))

}


blr_count_rsq <- function(model) {

  predicted <- model %>%
    predict(type = 'response')

  zero_one <- if_else(predicted >= 0.5, 1, 0)

  resp <- model %>%
    use_series(y)

  n <- resp %>%
    length

  correct <- if_else(zero_one == resp, 1, 0)

  correct %>%
    sum %>%
    divide_by(n)

}

blr_adj_count_rsq <- function(model) {

  n2 <- model %>%
    use_series(y) %>%
    table %>%
    max

  predicted <- model %>%
    predict(type = 'response')

  zero_one <- if_else(predicted >= 0.5, 1, 0)

  resp <- model %>%
    use_series(y)

  n <- resp %>%
    length

  correct <- if_else(zero_one == resp, 1, 0)

  num <- correct %>%
    sum %>%
    subtract(n2)

  den <- n %>%
    subtract(n2)

  num / den
}


