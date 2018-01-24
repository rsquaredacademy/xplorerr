blr_segment_dist <- function(data, response, predictor) UseMethod('blr_segment_dist')

blr_segment_dist.default <- function(data, response, predictor) {
  
  dist_table <- data %>%
    select(!! sym(predictor), !! sym(response)) %>%
    group_by(!! sym(predictor)) %>%
    summarise(n = n(), `1s` = table(!! sym(response))[[2]]) %>%
    mutate(
      `n%` = round((n / sum(n)), 2),
      `1s%` = round((`1s` / sum(n)), 2)
    )
  
  var_name <- dist_table %>%
    names %>%
    `[`(1)
  
  names(dist_table)[1] <- 'variable'
  
  result <- list(dist_table = dist_table, var_name = var_name)
  class(result) <- 'blr_segment_dist'
  return(result)
  
}


print.blr_segment_dist <- function(x, ...) {
  
  print_blr_segment_dist(x)
  
}

plot.blr_segment_dist <- function(x, title = NA, xaxis_title = 'Levels',
                                  yaxis_title = 'Sample Distribution',
                                  sec_yaxis_title = '1s Distribution',
                                  bar_color = 'blue', line_color = 'red',
                                  ...) {
  
  sec_axis_scale <- x %>%
    use_series(dist_table) %>%
    mutate(
      sec = `n%` / `1s%`
    ) %>%
    pull(sec) %>%
    min
  
  if (is.na(title)) {
    plot_title <- x$var_name
  } else {
    plot_title <- title
  }
  
  vname <- x %>%
    use_series(var_name)
  
  x %>%
    use_series(dist_table) %>%
    ggplot(aes(variable)) +
    geom_col(aes(y = `n%`), fill = bar_color) +
    geom_line(aes(y = `1s%`, group = 1), color = line_color) +
    xlab(xaxis_title) + ggtitle(plot_title) + ylab(yaxis_title) +
    scale_y_continuous(labels = scales::percent,
                       sec.axis = sec_axis(~./sec_axis_scale,
                                           name = sec_yaxis_title,
                                           labels = scales::percent)
    )
  
}

