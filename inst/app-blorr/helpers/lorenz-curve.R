source('helpers/utils.R')
source('helpers/output.R')

blr_gini_index <- function(model, data = NULL) {

  if (is.null(data)) {
    data <- model %>%
    use_series(data)
  }

  data$prob <- predict.glm(model, newdata = data, type = 'response')

  prob <- data %>%
    use_series(prob)

  n <- prob %>%
    length

  data %>%
    arrange(prob) %>%
    mutate(
      n = seq_len(n()),
      prob_n = prob * n
    ) %>%
    pull(prob_n) %>%
    sum %>%
    divide_by(prob %>%
                sum) %>%
    multiply_by(2) %>%
    subtract(n %>%
               add(1)) %>%
    divide_by(n)

}

blr_lorenz_curve <- function(model, data = NULL, title = 'Lorenz Curve',
                             xaxis_title = 'Cumulative Population %',
                             yaxis_title = 'Cumulative Events %',
                             diag_line_col = 'red',
                             lorenz_curve_col = 'blue') {

  if (is.null(data)) {
    data <- model %>%
      use_series(data)
  }

  data$prob <- predict.glm(model, newdata = data, type = 'response')

  prob <- data %>%
    arrange(prob) %>%
    pull(prob)


  n <- prob %>%
    length %>%
    rep(x = 1)

  p <- cumsum(n) %>%
    divide_by(sum(n)) %>%
    prepend(0)

  prob_cum <- prob %>%
    multiply_by(n)

  l <- cumsum(prob_cum) %>%
    divide_by(sum(prob_cum)) %>%
    prepend(0)

  g_index <- blr_gini_index(model = model, data = data) %>%
    round(2)

  tibble(p = p, l = l) %>%
    ggplot() +
    geom_line(aes(x = p, y = l), color = lorenz_curve_col) +
    geom_line(aes(x = p, y = p), color = diag_line_col) +
    ggtitle(label = title, subtitle = glue('Gini Index = ', {g_index})) +
    xlab(xaxis_title) + ylab(yaxis_title) +
    scale_x_continuous(labels = scales::percent) +
    scale_y_continuous(labels = scales::percent) +
    theme(
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    )

}
