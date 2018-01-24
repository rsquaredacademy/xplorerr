source('helpers/utils.R')
source('helpers/output.R')

blr_multi_model_fit_stats <- function(model, ...) UseMethod('blr_multi_model_fit_stats')

blr_multi_model_fit_stats.default <- function(model, ...) {

  k <- list(model, ...)
  j <- map(k, blr_model_fit_stats)

  n <- length(j)
  names(j) <- letters[seq_len(n)]

  for (i in seq_len(n)) {
    class(j[[i]]) <- 'list'
  }

  result <- list(mfit = map_df(j, as_tibble))
  class(result) <- 'blr_multi_model_fit_stats'
  return(result)

}

print.blr_multi_model_fit_stats <- function(x, ...) {

  df <- x %>%
    use_series(mfit) %>%
    select(-lr_df, -dev_df)

  measures <- c('Log-Lik Intercept Only', 'Log-Lik Full Model:', 'Deviance',
                'LR', 'Prob > LR:', "MCFadden's R2", "McFadden's Adj R2:",
                'ML (Cox-Snell) R2:', "Cragg-Uhler(Nagelkerke) R2:",
                "McKelvey & Zavoina's R2:", "Efron's R2:", 'Count R2:',
                "Adj Count R2:", "AIC:", 'BIC:')

  col_names <- paste('Model', x %>%
          use_series(mfit) %>%
          nrow %>%
          seq_len) %>%
    prepend('Measures')

  df %>%
    t %>%
    round(3)  %>%
    as_tibble %>%
    add_column(measures, .before = 1) %>%
    as.data.frame() %>%
    set_colnames(col_names) %>%
    print

}
