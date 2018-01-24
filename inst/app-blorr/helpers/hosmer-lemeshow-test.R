source('helpers/utils.R')
source('helpers/output.R')

blr_hosmer_lemeshow_test <- function(model, data = NULL)
  UseMethod('blr_hosmer_lemeshow_test')

blr_hosmer_lemeshow_test.default <- function(model, data = NULL) {

  if (is.null(data)) {
    data <- model %>%
      use_series(data) 
  }
  
  resp <- model %>%
    use_series(y) 
  
  data$prob <- predict.glm(model, newdata = data, type = 'response')

  data %<>%
    add_column(resp) %>%
    arrange(prob)

  int_limits <- data %>%
    use_series(prob) %>%
    quantile(probs = seq(0, 1, 0.1)) %>%
    unname

  data %<>%
    mutate(
      group = case_when(
        prob <= int_limits[2] ~ 1,
        prob > int_limits[2] & prob <= int_limits[3] ~ 2,
        prob > int_limits[3] & prob <= int_limits[4] ~ 3,
        prob > int_limits[4] & prob <= int_limits[5] ~ 4,
        prob > int_limits[5] & prob <= int_limits[6] ~ 5,
        prob > int_limits[6] & prob <= int_limits[7] ~ 6,
        prob > int_limits[7] & prob <= int_limits[8] ~ 7,
        prob > int_limits[8] & prob <= int_limits[9] ~ 8,
        prob > int_limits[9] & prob <= int_limits[10] ~ 9,
        prob > int_limits[10] ~ 10
      )
    )


  hoslem_table <- data %>%
    group_by(group) %>%
    summarise(n = n(), `1s_observed` = sum(resp),
              `0s_observed` = n - `1s_observed`,
              avg_prob = mean(prob),
              `1s_expected` = n * avg_prob,
              `0s_expected` = n - `1s_expected`,
              positive = ((`1s_observed` - `1s_expected`) ^ 2 / `1s_expected`),
              negative = ((`0s_observed` - `0s_expected`) ^ 2 / `0s_expected`))


  chisq_stat <- hoslem_table %>%
    select(positive, negative) %>%
    summarise_all(sum) %>%
    sum

  hoslem_df <- 8

  hoslem_pval <- pchisq(chisq_stat, df = hoslem_df, lower.tail = FALSE)

  result <- list(partition_table = hoslem_table,
                 chisq_stat = chisq_stat, df = hoslem_df,
                 pvalue = hoslem_pval)

  class(result) <- 'blr_hosmer_lemeshow_test'
  return(result)

}

print.blr_hosmer_lemeshow_test <- function(x, ...) {

  print_blr_hosmer_lemeshow_test(x)

}
