source('helpers/utils.R')
source('helpers/output.R')

blr_gains_table <- function(model, data = NULL) UseMethod('blr_gains_table')

blr_gains_table.default <- function(model, data = NULL) {

  if (is.null(data)) {
    data <- model %>%
      use_series(data) 
  }

  decile_count <- data %>%
    nrow %>%
    divide_by(10) %>%
    ceiling

    gains_table <- model %>%
      model.frame() %>%
      model.response() %>%
      as_tibble() %>%
      bind_cols(predict.glm(model, newdata = data, type = 'response') %>%
                  as_tibble) %>%
      select(response = value, prob = value1) %>%
      arrange(desc(prob)) %>%
      add_column(decile = rep(1:10, each = decile_count)) %>%
      group_by(decile) %>%
      summarise(total = n(), `1` = table(response)[[2]]) %>%
      mutate(
        `0` = total - `1`,
        cum_1s = cumsum(`1`),
        cum_0s = cumsum(`0`),
        cum_total = cumsum(total),
        `cum_total_%` = (cum_total / sum(total)) * 100,
        `cum_1s_%` = (cum_1s / sum(`1`)) * 100,
        `cum_0s_%` = (cum_0s / sum(`0`)) * 100,
        ks = `cum_1s_%` - `cum_0s_%`,
        tp = cum_1s,
        tn = cum_0s[10] - cum_0s,
        fp = cum_0s,
        fn = cum_1s[10] - cum_1s,
        sensitivity = (tp / (tp + fn)) * 100,
        specificity = (tn / (tn + fp)) * 100,
        accuracy = ((tp + tn) / cum_total[10]) * 100
    )

    result <- list(gains_table = gains_table)
    class(result) <- c('blr_gains_table')
    return(result)

}

print.blr_gains_table <- function(x, ...) {
  x %>%
    use_series(gains_table) %>%
    select(-cum_1s, -cum_0s, -cum_total, -`cum_total_%`,
           -`cum_1s_%`, -`cum_0s_%`) %>%
    print
}

plot.blr_gains_table <- function(x, title = 'Lift Chart', xaxis_title = '% Population',
                                 yaxis_title = '% Cumulative 1s', diag_line_col = 'red',
                                 lift_curve_col = 'blue', plot_title_justify = 0.5, ...) {

  x %>%
    use_series(gains_table) %>%
    select(`cum_total_%`, `cum_1s_%`) %>%
    mutate(
      cum_total_per = `cum_total_%` / 100 ,
      cum_1s_per = `cum_1s_%` / 100 ,
      cum_total_y = cum_total_per
    ) %>%
    select(cum_total_per, cum_1s_per, cum_total_y) %>%
    add_row(cum_total_per = 0, cum_1s_per = 0, cum_total_y = 0, .before = 1) %>%
    ggplot() +
    geom_line(aes(x = cum_total_per, y = cum_1s_per), color = lift_curve_col) +
    geom_line(aes(x = cum_total_per, y = cum_total_y), color = diag_line_col) +
    ggtitle(title) + xlab(xaxis_title) + ylab(yaxis_title) +
    scale_x_continuous(labels = scales::percent) +
    scale_y_continuous(labels = scales::percent) +
    theme(
      plot.title = element_text(hjust = plot_title_justify)
    )


}


blr_ks_chart <- function(gains_table, title = 'KS Chart', yaxis_title = ' ',
                         xaxis_title = 'Cumulative Population %',
                         ks_line_color = 'black') {

  ks_line <- gains_table %>%
    use_series(gains_table) %>%
    select(`cum_total_%`, `cum_1s_%`, `cum_0s_%`, ks) %>%
    filter(ks == max(ks)) %>%
    divide_by(100)

  annotate_y <- ks_line %>%
    mutate(
      ann_loc = (`cum_1s_%` - `cum_0s_%`) / 2,
      ann_locate = `cum_0s_%` + ann_loc
    ) %>%
    pull(ann_locate)

  ks_stat <- ks_line %>%
    pull(4) %>%
    round(2) %>%
    multiply_by(100)

  annotate_x <- ks_line %>%
    pull(1) +
    0.1

  gains_table %>%
    use_series(gains_table) %>%
    select(`cum_total_%`, `cum_1s_%`, `cum_0s_%`) %>%
    mutate(
      cum_total_per = `cum_total_%` / 100 ,
      cum_1s_per = `cum_1s_%` / 100 ,
      cum_0s_per = `cum_0s_%` / 100
    ) %>%
    select(cum_total_per, cum_1s_per, cum_0s_per) %>%
    add_row(cum_total_per = 0, cum_1s_per = 0, cum_0s_per = 0, .before = 1) %>%
    ggplot(aes(x = cum_total_per)) +
    geom_line(aes(y = cum_1s_per, color = 'Cumulative 1s %')) +
    geom_line(aes(y = cum_0s_per, color = 'Cumulative 0s %')) +
    geom_point(aes(y = cum_1s_per, color = 'Cumulative 1s %')) +
    geom_point(aes(y = cum_0s_per, color = 'Cumulative 0s %')) +
    geom_segment(x = ks_line[[1]], xend = ks_line[[1]], y = ks_line[[3]],
                 yend = ks_line[[2]], color = ks_line_color) +
    annotate("text", x = annotate_x, y = annotate_y, label = paste0('KS: ', ks_stat, '%')) +
    ggtitle(title) + xlab(xaxis_title) + ylab(yaxis_title) +
    scale_x_continuous(labels = scales::percent) +
    scale_y_continuous(labels = scales::percent) +
    theme(
      plot.title = element_text(hjust = 0.5),
      legend.title=element_blank()
    )


}
