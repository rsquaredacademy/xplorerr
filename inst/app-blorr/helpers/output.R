print_blr_reg <- function(x) {

  w1 <- max(nchar('Data Set'), nchar(x$dataname))
  w2 <- max(nchar('Resp Var'), nchar(x$resp_name))
  w3 <- max(nchar('Obs.'), nchar(x$n_obs))
  w4 <- max(nchar('Df. Model'), nchar(x$mod_df))
  w5 <- max(nchar('Df. Residual'), nchar(x$resid_df))
  w6 <- max(nchar('Convergence'), nchar(x$converge))
  w7 <- sum(w1, w2, w3, w4, w5, w6,20)

  cat(fc('Model Overview', w7), '\n')
  cat(rep("-", w7), sep = "", '\n')
  cat(fg('Data Set', w1), fs(), fg('Resp Var', w2), fs(), fg('Obs.', w3),
      fs(), fg('Df. Model', w4), fs(), fc('Df. Residual', w5), fs(),
      fc('Convergence', w6), '\n')
  cat(rep("-", w7), sep = "", '\n')
  cat(fc(x$dataname, w1), fs(), fc(x$resp_name, w2), fs(), fc(x$n_obs, w3),
      fs(), fc(x$mod_df, w4), fs(), fc(x$resid_df, w5), fs(),
      fc(x$converge, w6), '\n')
  cat(rep("-", w7), sep = "", '\n\n')

  w8 <- nchar('Outcome')
  w9 <- c('Frequency', x$resp_prof[[1]], x$resp_prof[[2]]) %>%
    map_int(nchar) %>% max
  w10 <- sum(w8, w9, w8, w9, 24)

  cat(fc('Response Summary', w10), '\n')
  cat(rep("-", w10), sep = "", '\n')
  cat(fc('Outcome', w8), fs3(), fc('Frequency', w9), fs3(),
      fc('Outcome', w8), fs3(), fc('Frequency', w9),'\n')
  cat(rep("-", w10), sep = "", '\n')
  cat(fc(0, w8), fs3(), fc(x$resp_prof[[1]], w9), fs3(),
      fc(1, w8), fs3(), fc(x$resp_prof[[2]], w9), '\n')
  cat(rep("-", w10), sep = "", '\n\n')

  w11 <- c('Parameter', x$parameter) %>%
    map_int(nchar) %>% max
  w12 <- 2
  w13 <- c('Estimate', format(round(x$est, 4), nsmall = 4)) %>%
    map_int(nchar) %>% max
  w14 <- c('Std.Error', format(round(x$se, 4), nsmall = 4)) %>%
    map_int(nchar) %>% max
  w15 <- c('z value', format(round(x$zval, 4), nsmall = 4)) %>%
    map_int(nchar) %>% max
  w16 <- c('Pr(>|z|)', format(round(x$pval, 4), nsmall = 4)) %>%
    map_int(nchar) %>% max
  w17 <- sum(w11, w12, w13, w14, w15, w16, 20)

  mln <- length(x$parameter)

  cat(fc('Maximum Likelihood Estimates', w17), '\n')
  cat(rep("-", w17), sep = "", '\n')
  cat(fc('Parameter', w11), fs(), fc('DF', w12), fs(), fc('Estimate', w13),
      fs(), fg('Std. Error', w14), fs(), fl('z value', w15), fs(),
      fg('Pr(>|z|)', w16), '\n')
  cat(rep("-", w17), sep = "", '\n')
  for (i in seq_len(mln)) {
    cat(fc(x$parameter[i], w11), fs(), fc(x$df[i], w12), fs(),
        fc(format(round(x$est[i], 4), nsmall = 4), w13),
        fs(), fg(format(round(x$se[i], 4), nsmall = 4), w14), fs(),
        fw(format(round(x$zval[i], 4), nsmall = 4), w15), fs(),
        fg(format(round(x$pval[i], 4), nsmall = 4), w16), '\n')
  }
  cat(rep("-", w17), sep = "", '\n\n')

  # odds ration estimates
  w18 <- c('Odds Ratio', x$blr_effects) %>%
    nchar %>%
    max
  w19 <- c('Estimate', x$blr_odds_point) %>%
    nchar %>%
    max
  w20 <- x$blr_conf %>%
    use_series(`2.5 %`) %>%
    format(round(4), nsmall = 4) %>%
    prepend('95% Wald') %>%
    nchar %>%
    max
  w21 <- x$blr_conf %>%
    use_series(`97.5 %`) %>%
    format(round(4), nsmall = 4) %>%
    prepend('Conf. Limit') %>%
    nchar %>%
    max

  w22 <- sum(w18, w19, w20, w21, 12)

  oddn <- length(x$blr_effects)

  cat(fc('Odds Ratio Estimates', w22), '\n')
  cat(rep("-", w22), sep = "", '\n')
  cat(fc('Effects', w18), fs(), fc('Estimate', w19), fs(), ' ', fg('95% Wald', w20),
      fl('Conf. Limit', w21), '\n')
  cat(rep("-", w22), sep = "", '\n')
  for (i in seq_len(oddn)) {
    cat(fc(x$blr_effects[i], w18), fs(),
        fc(format(round(x$blr_odds_point[i], 4), nsmall = 4), w19), fs(),
        fc(format(round(x$blr_conf$`2.5 %`[i], 4), nsmall = 4), w20),
        fs(), fg(format(round(x$blr_conf$`97.5 %`[i], 4), nsmall = 4), w21), '\n')
  }
  cat(rep("-", w22), sep = "", '\n\n')

  w23 <- 12
  w24 <- x$blr_cord %>%
    extract(1:4) %>%
    unlist(use.names = FALSE) %>%
    format(round(4), nsmall = 4) %>%
    nchar %>%
    max
  w25 <- 9
  w26 <- x$blr_cord %>%
    extract(5:8) %>%
    unlist(use.names = FALSE) %>%
    format(round(4), nsmall = 4) %>%
    nchar %>%
    max
  w27 <- sum(w23, w24, w25, w26, 21)

  cat(fc('Association of Predicted Probabilities and Observed Responses', w27), '\n')
  cat(rep("-", w27), sep = "", '\n')
  cat(fl('% Concordant', w23), fs2(),
      fc(format(round(x$blr_cord[[2]], 4), nsmall = 4), w24), fs2(),
      fl("Somers' D", w25), fs2(),
      fc(format(round(x$blr_cord[[5]], 4), nsmall = 4), w26),'\n')
  cat(fl('% Discordant', w23), fs2(),
      fc(format(round(x$blr_cord[[3]], 4), nsmall = 4), w24), fs2(),
      fl('Gamma', w25), fs2(),
      fc(format(round(x$blr_cord[[6]], 4), nsmall = 4), w26),'\n')
  cat(fl('% Tied', w23), fs2(),
      fc(format(round(x$blr_cord[[4]], 4), nsmall = 4), w24), fs2(),
      fl('Tau-a', w25), fs2(),
      fc(format(round(x$blr_cord[[7]], 4), nsmall = 4), w26),'\n')
  cat(fl('Pairs', w23), fs2(),
      fc(x$blr_cord[[1]], w24), fs2(),
      fl('c', w25), fs2(),
      fc(format(round(x$blr_cord[[8]], 4), nsmall = 4), w26),'\n')
  cat(rep("-", w27), sep = "", '\n\n')

  # model fit stats
  # w28 <- 24
  # w30 <- 27
  # w29 <- c(x$modfit$loglik_null, x$modfit$m_deviance, x$modfit$m_bic) %>%
  #   format(round(3), nsmall = 3) %>%
  #   nchar %>%
  #   max
  # w31 <- c(x$modfit$loglik_model, x$modfit$lr_ratio, x$modfit$m_aic) %>%
  #   format(round(3), nsmall = 3) %>%
  #   nchar %>%
  #   max
  # w <- sum(w28, w29, w30, w31, 12)
  #
  # cat(fc('Model Fit Statistics', w), '\n')
  # cat(rep("-", w), sep = "", '\n')
  # col1names <- c('Log-Lik Intercept Only:', glue('Deviance(', x$modfit$dev_df, '):'), '',
  #                "MCFadden's R2", 'ML (Cox-Snell) R2:',
  #                "McKelvey & Zavoina's R2:", 'Count R2:', 'BIC:')
  # col3names <- c('Log-Lik Full Model:', glue('LR(', x$modfit$lr_df, '):'), 'Prob > LR:',
  #                "McFadden's Adj R2:", "Cragg-Uhler(Nagelkerke) R2:",
  #                "Efron's R2:", "Adj Count R2:", "AIC:")
  # col2vals <- c(x$modfit$loglik_null, x$modfit$m_deviance, x$modfit$mcfadden, x$modfit$cox_snell,
  #               x$modfit$mckelvey, x$modfit$count_r2, x$modfit$m_bic) %>%
  #   round(3) %>%
  #   format(nsmall = 3) %>%
  #   prepend(value = '', before = 3)
  # col4vals <- c(x$modfit$loglik_model, x$modfit$lr_ratio, x$modfit$lr_pval, x$modfit$adj_mcfadden,
  #               x$modfit$nagelkerke, x$modfit$effron, x$modfit$count_adj, x$modfit$m_aic) %>%
  #   round(3) %>%
  #   format(nsmall = 3)
  # nlen <- length(col3names)
  # for (i in seq_len(nlen)) {
  #   cat(fl(col1names[i], w28), fs(),
  #       fg(col2vals[i], w29), fs(),
  #       fl(col3names[i], w30), fs(),
  #       fg(col4vals[i], w31), '\n')
  # }
  # cat(rep("-", w), sep = "", '\n\n')

}


print_model_fit_stats <- function(x) {

  w1 <- 24
  w3 <- 27
  w2 <- c(x$loglik_null, x$m_deviance, x$m_bic) %>%
    format(round(3), nsmall = 3) %>%
    nchar %>%
    max
  w4 <- c(x$loglik_model, x$lr_ratio, x$m_aic) %>%
    format(round(3), nsmall = 3) %>%
    nchar %>%
    max
  w <- sum(w1, w2, w3, w4, 12)

  cat(fc('Model Fit Statistics', w), '\n')
  cat(rep("-", w), sep = "", '\n')
  col1names <- c('Log-Lik Intercept Only:', glue('Deviance(', x$dev_df, '):'), '',
                 "MCFadden's R2", 'ML (Cox-Snell) R2:',
                 "McKelvey & Zavoina's R2:", 'Count R2:', 'BIC:')
  col3names <- c('Log-Lik Full Model:', glue('LR(', x$lr_df, '):'), 'Prob > LR:',
                 "McFadden's Adj R2:", "Cragg-Uhler(Nagelkerke) R2:",
                 "Efron's R2:", "Adj Count R2:", "AIC:")
  col2vals <- c(x$loglik_null, x$m_deviance, x$mcfadden, x$cox_snell,
                x$mckelvey, x$count_r2, x$m_bic) %>%
    round(3) %>%
    format(nsmall = 3) %>%
    prepend(values = '', before = 3)
  col4vals <- c(x$loglik_model, x$lr_ratio, x$lr_pval, x$adj_mcfadden,
                x$nagelkerke, x$effron, x$count_adj, x$m_aic) %>%
    round(3) %>%
    format(nsmall = 3)
  nlen <- length(col3names)
  for (i in seq_len(nlen)) {
    cat(fl(col1names[i], w1), fs(),
        fg(col2vals[i], w2), fs(),
        fl(col3names[i], w3), fs(),
        fg(col4vals[i], w4), '\n')
  }
  cat(rep("-", w), sep = "", '\n\n')
}


print_bivariate_analysis <- function(x) {

  w1 <- max(nchar(c('Variable', x$variable)))
  w2 <- max(nchar(c('Information Value', x$iv)))
  w3 <- max(nchar(c('LR Chi Square', format(round(x$likelihood_ratio, 4),
                                          nsmall = 4))))
  w4 <- max(nchar(c('LR DF', x$df)))
  w5 <- max(nchar(c('LR p-value', format(round(x$pval, 4),
                                       nsmall = 4))))
  w <- sum(w1, w2, w3, w4, w5, 16)

  cat(fc('Bivariate Analysis', w), '\n')
  cat(rep("-", w), sep = "", '\n')
  cat(fc('Variable', w1), fs(), fc('Information Value', w2), fs(),
      fc('LR Chi Square', w3),fs(), fc('LR DF', w4), fs(),
      fc('LR p-value', w5), '\n')
  cat(rep("-", w), sep = "", '\n')
  n <- length(x[[1]])
  for (i in seq_len(n)) {
    cat(fc(x$variable[i], w1), fs(), fc(format(round(x$iv[i], 2), nsmall = 2), w2), fs(),
        fc(format(round(x$likelihood_ratio[i], 4), nsmall = 4), w3), fs(),
        fc(x$df[i], w4), fs(),
        fc(format(round(x$pval[i], 4), nsmall = 4), w5), '\n')
  }
  cat(rep("-", w), sep = "", '\n')

}


print_blr_segment <- function(x) {

  y1 <- x %>%
    use_series(segment_data) %>%
    map(as.character) %>%
    map(nchar) %>%
    map_int(max) %>%
    unname

  y2 <- x %>%
    use_series(segment_data) %>%
    names %>%
    nchar

  w <- map2_int(y1, y2, max)
  wsum <- sum(w, 11)

  rnames <- x %>%
    use_series(segment_data) %>%
    names

  dtable <- x %>%
    use_series(segment_data)

  c1 <- dtable %>%
    pull(rnames[1]) %>%
    prepend(rnames[1])

  c2 <- dtable %>%
    pull(rnames[2]) %>%
    round(2) %>%
    format(nsamll = 2) %>%
    prepend(rnames[2])

  clen <- length(c1)

  cat(fc('Event By Attributes', wsum), '\n')
  cat(rep("-", wsum), sep = "", '\n')
  for (i in seq_len(clen)) {
    cat(fc(c1[i], w[1]), fs4(), fc(c2[i], w[2]), '\n')
    if (i == 1) {
      cat(rep("-", wsum), sep = "", '\n')
    }
  }
  cat(rep("-", wsum), sep = "", '\n\n')

}


print_blr_segment_dist <- function(x) {

  y1 <- x %>%
    use_series(dist_table) %>%
    map(as.character) %>%
    map(nchar) %>%
    map_int(max) %>%
    unname

  y2 <- x %>%
    use_series(dist_table) %>%
    names %>%
    nchar

  w <- map2_int(y1, y2, max)
  wsum <- sum(w, 16)

  rnames <- x %>%
    use_series(dist_table) %>%
    names

  dtable <- x %>%
    use_series(dist_table)

  c1 <- dtable %>%
    pull(rnames[1]) %>%
    prepend(x %>%
              use_series(var_name))

  c2 <- dtable %>%
    pull(rnames[2]) %>%
    prepend(rnames[2])

  c3 <- dtable %>%
    pull(rnames[3]) %>%
    prepend(rnames[3])

  c4 <- dtable %>%
    pull(rnames[4]) %>%
    round(2) %>%
    format(nsamll = 2) %>%
    prepend(rnames[4])

  c5 <- dtable %>%
    pull(rnames[5]) %>%
    round(2) %>%
    format(nsamll = 2) %>%
    prepend(rnames[5])

  clen <- length(c1)

  cat(fc('Event Segmentation', wsum), '\n')
  cat(rep("-", wsum), sep = "", '\n')
  for (i in seq_len(clen)) {
    cat(fc(c1[i], w[1]), fs(), fc(c2[i], w[2]), fs(),
        fc(c3[i], w[3]), fs(), fc(c4[i], w[4]), fs(),
        fc(c5[i], w[5]), '\n')
    if (i == 1) {
      cat(rep("-", wsum), sep = "", '\n')
    }
  }
  cat(rep("-", wsum), sep = "", '\n\n')

}

print_blr_hosmer_lemeshow_test <- function(x) {

  w1 <- nchar('group')
  w2 <- x %>%
    use_series(partition_table) %>%
    use_series(n) %>%
    prepend('Total') %>%
    nchar %>%
    max
  w3 <- x %>%
    use_series(partition_table) %>%
    use_series(`1s_observed`) %>%
    prepend('Observed') %>%
    nchar %>%
    max
  w4 <- x %>%
    use_series(partition_table) %>%
    use_series(`1s_expected`) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend('Expected') %>%
    nchar %>%
    max
  w5 <- x %>%
    use_series(partition_table) %>%
    use_series(`0s_observed`) %>%
    prepend('Observed') %>%
    nchar %>%
    max
  w6 <- x %>%
    use_series(partition_table) %>%
    use_series(`0s_expected`) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend('Expected') %>%
    nchar %>%
    max
  w7 <- w3 + w4 + 4
  w8 <- w5 + w6 + 4
  w <- sum(w1, w2, w3, w4, w5, w6, 20)
  j <- x %>%
    use_series(partition_table)

  cat(fc('Partition for the Hosmer & Lemeshow Test', w), '\n')
  cat(rep("-", w), sep = "", '\n')
  cat(fc('     ', w1), fs(), fc('     ', w2), fs(), fc('def = 1', w7), fs(),
      fc('def = 0', w8), '\n')
  cat(fc('Group', w1), fs(), fc('Total', w2), fs(), fc('Observed', w3), fs(),
      fc('Expected', w4), fs(), fc('Observed', w5), fs(), fc('Expected', w6),
      '\n')
  cat(rep("-", w), sep = "", '\n')
  for (i in seq_len(10)) {
    cat(fc(j$group[i], w1), fs(), fc(j$n[i], w2), fs(), fc(j$`1s_observed`[i], w3), fs(),
        fc(format(round(j$`1s_expected`[i], 2), nsmall = 2), w4), fs(), fc(j$`0s_observed`[i], w5), fs(),
        fc(format(round(j$`0s_expected`[i], 2), nsmall = 2), w6), '\n')
  }
  cat(rep("-", w), sep = "", '\n\n')

  w9 <- x %>%
    use_series(chisq_stat) %>%
    round(4) %>%
    format(nsmall = 4) %>%
    prepend('Chi-Square') %>%
    nchar %>%
    max
  w10 <- 2
  w11 <- 10
  w12 <- sum(w9, w10, w11, 8)

  cat(fc('Goodness of Fit Test', w12), '\n')
  cat(rep("-", w12), sep = "", '\n')
  cat(fc('Chi-Square', w9), fs(), fc('DF', w10), fs(), fc('Pr > ChiSq', w11),
      '\n')
  cat(rep("-", w12), sep = "", '\n')
  cat(fc(format(round(x$chisq_stat, 4), nsmall = 4), w9), fs(), fc(x$df, w10),
      fs(), fc(format(round(x$pvalue, 4), nsmall = 4), w11),
      '\n')
  cat(rep("-", w12), sep = "", '\n')


}


print_blr_lr_test <- function(x) {

  w9 <- x %>%
    use_series(test_result) %>%
    pull(lr_ratio) %>%
    round(4) %>%
    format(nsmall = 4) %>%
    prepend('Chi-Square') %>%
    nchar %>%
    max
  w10 <- x %>%
    use_series(test_result) %>%
    pull(d_f) %>%
    prepend('DF') %>%
    nchar %>%
    max
  w11 <- 10
  w12 <- sum(w9, w10, w11, 8)

  j <- x %>%
    use_series(test_result)

  cat(fc('Likelihood Ratio Test', w12), '\n')
  cat(rep("-", w12), sep = "", '\n')
  cat(fc('Chi-Square', w9), fs(), fc('DF', w10), fs(), fc('Pr > ChiSq', w11),
      '\n')
  cat(rep("-", w12), sep = "", '\n')
  cat(fc(format(round(j$lr_ratio, 4), nsmall = 4), w9), fs(), fc(j$d_f, w10),
      fs(), fc(format(round(j$p_value, 4), nsmall = 4), w11),
      '\n')
  cat(rep("-", w12), sep = "", '\n')

}


print_blr_confusion_matrix <- function(x) {

  r1 <- x %>%
    use_series(confusion_matrix) %>%
    rownames


  w1 <- r1 %>%
    prepend('Observed') %>%
    nchar %>%
    max

  r2 <- x %>%
    use_series(confusion_matrix) %>%
    `[`(, 1) %>%
    unname


  w2 <- r2 %>%
    prepend('0') %>%
    nchar %>%
    max

  r3 <- x %>%
    use_series(confusion_matrix) %>%
    `[`(, 2) %>%
    unname


  w3 <- r3 %>%
    prepend('1') %>%
    nchar %>%
    max

  w <- sum(w1, w2, w3, 16)
  w16 <- sum(w2, w3, 8)

  cat(f16(), fc('Predicted', w16), '\n')
  cat(rep("-", w), sep = "", '\n')
  cat(fc('Observed', w1), fs3(), fg('0', w2), fs3(), fg('1', w3), '\n')
  cat(rep("-", w), sep = "", '\n')
  for (i in seq_len(2)) {
    cat(fc(r1[i], w1), fs3(), fg(r2[i], w2), fs3(), fg(r3[i], w3), '\n')
  }
  cat(rep("-", w), sep = "", '\n\n')
  cat(fc('Model Performance Measures', 30), '\n')
  cat(rep("-", 30), sep = "", '\n')
  cat('Accuracy               ', format(round(x$accuracy, 4), nsmall = 4),
      '\nPrecision              ', format(round(x$precision, 4), nsmall = 4),
      '\nSensitivity            ', format(round(x$sensitivity, 4), nsmall = 4),
      '\nSpecificity            ', format(round(x$specificity, 4), nsmall = 4),
      '\nRecall                 ', format(round(x$recall, 4), nsmall = 4),
      '\nPrevalence             ', format(round(x$prevalence, 4), nsmall = 4),
      '\nDetection Rate         ', format(round(x$detection_rate, 4), nsmall = 4),
      '\nDetection Prevalence   ', format(round(x$detection_prevalence, 4), nsmall = 4),
      '\nBalanced Accuracy      ', format(round(x$balanced_accuracy, 4), nsmall = 4),
      '\nPos Predicted Value    ', format(round(x$pos_pred_value, 4), nsmall = 4),
      '\nNeg Predicted Value    ', format(round(x$neg_pred_value, 4), nsmall = 4))

}


print_blr_woe_iv <- function(x) {

  y1 <- x %>%
    use_series(woe_iv_table) %>%
    map(nchar) %>%
    map_int(max)

  y2 <- x %>%
    use_series(woe_iv_table) %>%
    names %>%
    nchar

  w <- map2_int(y1, y2, max)
  wsum <- sum(w, 24)

  rnames <- x %>%
    use_series(woe_iv_table) %>%
    names

  woe_iv <- x %>%
    use_series(woe_iv_table)

  c1 <- woe_iv %>%
    pull(rnames[1]) %>%
    prepend(rnames[1])

  c2 <- woe_iv %>%
    pull(rnames[2]) %>%
    prepend(rnames[2])

  c3 <- woe_iv %>%
    pull(rnames[3]) %>%
    prepend(rnames[3])

  c4 <- woe_iv %>%
    pull(rnames[4]) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend(rnames[4])

  c5 <- woe_iv %>%
    pull(rnames[5]) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend(rnames[5])

  c6 <- woe_iv %>%
    pull(rnames[6]) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend(rnames[6])

  c7 <- woe_iv %>%
    pull(rnames[7]) %>%
    round(2) %>%
    format(nsmall = 2) %>%
    prepend(rnames[7])

  clen <- length(c1)

  cat(fc('Weight of Evidence', wsum), '\n')
  cat(rep("-", wsum), sep = "", '\n')
  for (i in seq_len(clen)) {
    cat(fc(c1[i], w[1]), fs(), fc(c2[i], w[2]), fs(),
        fc(c3[i], w[3]), fs(), fg(format(c4[i], nsmall = 2), w[4]), fs(),
        fg(format(c5[i], nsmall = 2), w[5]), fs(), fg(format(c6[i], nsmall = 2), w[6]), fs(),
        fc(format(c7[i], nsmall = 2), w[7]), '\n')
    if (i == 1) {
      cat(rep("-", wsum), sep = "", '\n')
    }
  }
  cat(rep("-", wsum), sep = "", '\n\n')

  l1 <- c('Variable', x$var_name) %>%
    nchar %>%
    max
  l2 <- 17
  lsum <- sum(l1, l2, 4)

  ivalue <- woe_iv %>%
    pull(iv) %>%
    sum

  cat(fc('Information Value', lsum), '\n')
  cat(rep("-", lsum), sep = "", '\n')
  cat(fc('Variable', l1), fs(), fc('Information Value', l2), '\n')
  cat(rep("-", lsum), sep = "", '\n')
  cat(fc(x$var_name, l1), fs(), fc(ivalue, l2), '\n')
  cat(rep("-", lsum), sep = "", '\n')

}


print_forward_selection <- function(data) {

  if (data$steps < 1) {
    stop('No variables have been added to the model.')
  }

        # width
        w3 <- max(nchar('Step'), nchar(data$steps))
        w1 <- max(nchar('Predictor'), nchar(data$predictors))
        w2 <- max(nchar('AIC'), nchar(format(round(data$aics, 3), nsmall = 3)))
        w4 <- max(nchar('BIC'), nchar(format(round(data$bics, 3), nsmall = 3)))
        w5 <- max(nchar('Deviance'), nchar(format(round(data$devs, 3), nsmall = 3)))
        w <- sum(w3, w1, w2, w4, w5, 16)

        ln <- length(data$aics)

        # cat(format("Forward Selection Method", justify = "left", width = w), "\n")
        # cat(rep("-", 24), sep = "", '\n\n')
        # cat(format("Candidate Terms:", justify = "left", width = w), "\n\n")
        # for (i in seq_len(length(data$candidates))) {
        #     cat(format(paste(i, ".", data$candidates[i]), justify = "left", width = w), "\n")
        # }
        cat("\n")
        cat(format("Selection Summary", justify = "centre", width = w), "\n")
        cat(rep("-", w), sep = "", '\n')
        cat(fl('Step', w3), fs(), fl('Variable', w1), fs(), fc('AIC', w2), fs(),
         fc('BIC', w4), fs(), fc('Deviance', w5), '\n')
        cat(rep("-", w), sep = "", '\n')
        for (i in seq_len(ln)) {
            cat(fl(seq_len(data$steps)[i], w3), fs(), fl(data$predictors[i], w1), fs(),
              fg(format(round(data$aics[i], 3), nsmall = 3), w2), fs(),
              fg(format(round(data$bics[i], 3), nsmall = 3), w4), fs(),
              fg(format(round(data$devs[i], 3), nsmall = 3), w5), '\n')
        }
        cat(rep("-", w), sep = "", '\n')

}


print_backward_elimination <- function(data) {

  if (data$steps < 1) {
    stop('No variables have been removed from the model.')
  }

    # width
    w1 <- max(nchar('Full Model'), nchar(data$predictors))
    w2 <- max(nchar('AIC'), nchar(format(round(data$aics, 3), nsmall = 3)))
    w3 <- max(nchar('BIC'), nchar(format(round(data$bics, 3), nsmall = 3)))
    w4 <- max(nchar('Deviance'), nchar(format(round(data$devs, 3), nsmall = 3)))
    w <- sum(w1, w2, w3, w4, 12)

    predictors <- c('Full Model', data$predictors)

    ln <- length(data$aics)

    cat('\n\n', format('Backward Elimination Summary', width = w, justify = 'centre'), '\n')
    cat(rep("-", w), sep = "", '\n')
    cat(fl('Variable', w1), fs(), fc('AIC', w2), fs(),
        fc('BIC', w3), fs(), fc('Deviance', w4), '\n')
    cat(rep("-", w), sep = "", '\n')
    for (i in seq_len(ln)) {
        cat(fl(predictors[i], w1), fs(), fg(format(round(data$aics[i], 3), nsmall = 3), w2), fs(),
            fg(format(round(data$bics[i], 3), nsmall = 3), w3), fs(),
            fg(format(round(data$devs[i], 3), nsmall = 3), w4), '\n')
    }
    cat(rep("-", w), sep = "", '\n\n')

}


print_stepwise_selection <- function(data) {

  if (data$steps < 1) {
    stop('No variables have been added to or removed from the model.')
  }

    # width
    w1 <- max(nchar('Variable'), nchar(data$predictors))
    w2 <- max(nchar('AIC'), nchar(format(round(data$aic, 3), nsmall = 3)))
    w3 <- max(nchar('BIC'), nchar(format(round(data$bic, 3), nsmall = 3)))
    w4 <- max(nchar('Deviance'), nchar(format(round(data$dev, 3), nsmall = 3)))
    w5 <- nchar('Addition')
    w <- sum(w1, w2, w3, w4, w5, 16)

    ln <- length(data$aic)

    cat('\n\n', format('Stepwise Summary', width = w, justify = 'centre'), '\n')
    cat(rep("-", w), sep = "", '\n')
    cat(fl('Variable', w1), fs(), fc('Method', w5), fs(), fc('AIC', w2), fs(),
        fc('BIC', w3), fs(), fc('Deviance', w4), '\n')
    cat(rep("-", w), sep = "", '\n')
    for (i in seq_len(ln)) {
        cat(fl(data$predictors[i], w1), fs(), fl(data$method[i], w5), fs(),
            fg(format(round(data$aic[i], 3), nsmall = 3), w2), fs(),
            fg(format(round(data$bic[i], 3), nsmall = 3), w3), fs(),
            fg(format(round(data$dev[i], 3), nsmall = 3), w4), '\n')
    }
    cat(rep("-", w), sep = "", '\n\n')

}


print_blr_twoway_segment <- function(x) {

  cnames <- x %>%
    use_series(twoway_segment) %>%
    colnames %>%
    prepend(x %>%
      use_series(varnames) %>%
      extract(1))

  k <- x %>%
    use_series(twoway_segment) %>%
    rownames %>%
    cbind(x %>%
            use_series(twoway_segment) %>%
            round(3) %>%
            format(nsmall = 3))

  nc <- ncol(k)
  nr <- nrow(k)

  wc <- k %>%
    nchar %>%
    max

  vname <- x %>%
    use_series(varnames) %>%
    extract(2)

  w <- (nc * wc) + (4 * (nc - 1))
  w2 <- w - wc - 4 - 3
  cat(paste0(rep(' ', wc)), fs(), fc(vname, w2), '\n')
  cat(rep("-", w), sep = "", '\n')
  for (i in seq_len(nc)) {
    cat(fc(cnames[i], wc), fs())
  }
  cat('\n')
  cat(rep("-", w), sep = "", '\n')
  for (i in seq_len(nr)) {
    for (j in seq_len(nc)) {
      cat(fc(k[i, j], wc), fs())
    }
    cat('\n')
    cat(rep("-", w), sep = "", '\n')
  }


}
