source('helper/utils.R')
source('helper/output.R')

freq_table <- function(dframe, x) UseMethod("freq_table")

freq_table.default <- function(dframe, x) {

  if (!is.data.frame(dframe)) {
    stop('dframe must be a data frame')
  }  

  if (!is.character(x)) {
    stop('x must be character')
  }

  if (!x %in% colnames(dframe)) {
    stop('x must be a column in dframe')
  }

  var_name <- x
  data <- dframe %>%
          select_(x) %>%
          as.data.frame() %>%
          unlist() %>%
          na.omit() %>% 
          as.factor()
          
  level_names <- levels(data)

  data_len <- length(data)
  result <- as.vector(table(data))
  len <- length(result)
  cum <- cumsum(result)
  per <- percent(result, data_len)
  cum_per <- percent(cum, data_len)

  ftable <- cbind(level_names, result, cum, per, cum_per)
  

  colnames(ftable) <- c("Levels", "Frequency", "Cum Frequency",
                        "Percent", "Cum Percent")

  result <- list(
    ftable = ftable,
    varname = var_name
  )

  class(result) <- "freq_table"
  return(result)

}


print.freq_table <- function(data) {
  print_ftable(data)
}


barplot.freq_table <- function(height, ...) {
    j <- as.numeric(height$ftable[, 2])
    h <- j
    ymax <- max(h)
    cols <- length(j)
    x_names <- height$ftable[, 1]
    k <- barplot(j, col = topo.colors(cols),
                 main = paste('Bar Plot of', height$varname),
                 xlab = height$varname,
                 ylab = 'Frequency',
                 ylim = c(0, ymax[1]),
                 names.arg = x_names)
    graphics::text(k, h, labels = j, adj = 0.5, pos = 1)
}
