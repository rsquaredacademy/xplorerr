source('helper/utils.R')
source('helper/output.R')
source('helper/describe.R')

group_summary <- function(dframe, x, y) UseMethod('group_summary')

group_summary.default <- function(dframe, x, y) {

    if(!is.data.frame(dframe)) {
      stop('dframe must be a data frame')
    }

    if (!is.character(x)) {
      stop('x must be character')
    }

    if (!x %in% colnames(dframe)) {
      stop('x must be a column in dframe')
    }

    if (!is.character(y)) {
      stop('y must be character')
    }

    if (!y %in% colnames(dframe)) {
      stop('y must be a column in dframe')
    }

    xname <- x
    yname <- y

    dfr <- dframe %>%
             select_(x, y) %>%
             as.data.frame() %>%
             na.omit()

    x <- dfr %>%
           select_(x) %>%
           as.data.frame() %>%
           unlist() 

    y <- dfr %>%
           select_(y) %>%
           as.data.frame() %>%
           unlist() 

    split_dat <- tapply(y, list(x), function(x) {
                      c(length(x), min(x), max(x), mean(x), median(x),
                      descriptr::stat_mode(x), sd(x), var(x), skewness(x),
                      kurtosis(x), stat_uss(x),
                      stat_css(x), stat_cvar(x),
                      std_error(x), stat_range(x), IQR(x))
                 })

    splito <- sapply(split_dat, round, 2)

    rnames <- c('Obs', 'Maximum', 'Minimum', 'Mean', 'Median', 'Mode',
                'Std. Deviation', 'Variance', 'Skewness', 'Kurtosis',
                'Uncorrected SS', 'Corrected SS', 'Coeff Variation',
                'Std. Error Mean', 'Range', 'Interquartile Range')

    out <- data.frame(rnames, splito)
    names(out) <- c('Statistic/Levels', levels(x))

    plot_data <- data.frame(x, y)
    names(plot_data) <- c(xname, yname)

    result <- list(stats  = out,
                   plotdata = plot_data,
                   xvar  = xname,
                   yvar  = yname)

    class(result) <- 'group_summary'
    return(result)
}


print.group_summary <- function(x, ...) {
    print_group(x)
}


boxplot.group_summary <- function(x, ...) {
    n <- nlevels(factor(x$plotdata[[1]]))
    boxplot(x$plotdata[[2]] ~ x$plotdata[[1]],
        col = rainbow(n), xlab = x$xvar,
        ylab = x$yvar,
        main = paste('Box Plot of', x$yvar, 'by', x$xvar))
}
