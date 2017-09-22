source('helper/utils.R')
source('helper/output.R')

cross_table <- function(dframe, var1, var2) UseMethod("cross_table")

cross_table.default <- function(dframe, var1, var2) {

    if(!is.data.frame(dframe)) {
      stop('dframe must be a data frame')
    }

    if (!is.character(var1)) {
      stop('var1 must be character')
    }

    if (!var1 %in% colnames(dframe)) {
      stop('var1 must be a column in dframe')
    }

    if (!is.character(var2)) {
      stop('var2 must be character')
    }

    if (!var2 %in% colnames(dframe)) {
      stop('var2 must be a column in dframe')
    }

    var_1 <- var1
    var_2 <- var2
    var_names <- c(var_1, var_2)

    dfr <- dframe %>%
             select_(var1, var2) %>%
             as.data.frame() %>%
             na.omit()

    var1 <- dfr %>%
               select_(var1) %>%
               as.data.frame() %>%
               unlist() 

    var2 <- dfr %>%
              select_(var2) %>%
              as.data.frame() %>%
              unlist() 


    x <- as.matrix(table(var1, var2))
    rownames(x) <- NULL
    n <- length(var1)
    if (is.factor(var1)) {
        row_name <- levels(var1)
    } else {
        row_name <- unique(sort(var1))
    }
    per_mat <- round(x/n, 3)
    row_pct <- apply(per_mat, 1, sum)
    col_pct <- apply(per_mat, 2, sum)
    per_mat <- cbind(per_mat, row_pct)
    per_mat <- suppressWarnings(rbind(per_mat, col_pct))
    d <- dim(per_mat)
    per_mat[d[1], d[2]] <- 1
    rowtotal <- apply(x, 1, sum)
    coltotal <- apply(x, 2, sum)
    rcent <- row_pct(x, rowtotal)
    rcent <- cbind(rcent, row_pct)
    rcent <- apply(rcent, c(1, 2), rounda)
    ccent <- col_pct(x, coltotal)
    ccent <- apply(ccent, c(1, 2), rounda)
    x <- cbind(x, rowtotal)
    x <- cbind(unname(row_name), x)
    if (is.factor(var2)) {
        col_name <- levels(var2)
    } else {
        col_name <- unique(sort(var2))
    }

    result <- list(obs = n, var2_levels = col_name, var1_levels = row_name, varnames = var_names,
        twowaytable = x, percent_table = per_mat, row_percent = rcent, column_percent = ccent,
        column_totals = coltotal, percent_column = col_pct)


    class(result) <- "cross_table"
    return(result)
}


print.cross_table <- function(x, ...) {
    print_cross(x)
}

plot.cross_table <- function(x, beside = FALSE, proportional = FALSE, ...) {
    i_data <- x$twowaytable
    nb <- ncol(i_data)
    bdata <- i_data[, c(-1, -nb)]
    ln <- length(x$var2_levels)
    bardata <- matrix(as.numeric(bdata), ncol = ln)
    cols <- nrow(bardata)


    # proportional stacked bar plots
    if (proportional == TRUE) {

        colbar <- colSums(bardata)
        nh <- nrow(bardata)
        h <- rep(colbar, nh)
        hichka <- matrix(h, nrow = nh, byrow = T)
        propo_data <- round((bardata/hichka) * 100, 2)
        barplot(propo_data, col = rainbow(cols), main = paste(x$varnames[1],
            "by", x$varnames[2]), xlab = x$varnames[2], ylab = x$varnames[1],
            legend.text = T)
        result <- list(data = propo_data)

    } else {

        barplot(bardata, col = rainbow(cols), beside = beside,
                main = paste(x$varnames[1], "by", x$varnames[2]),
                xlab = x$varnames[2], ylab = x$varnames[1],
                legend.text = T)
        result <- list(data = bardata)
    }

    invisible(result)
}

mosaicplot.cross_table <- function(x, ...) {
    i_data <- x$twowaytable
    nb <- ncol(i_data)
    mdata <- i_data[, c(-1, -nb)]
    ln <- length(x$var2_levels)
    modata <- matrix(as.numeric(mdata), ncol = ln)
    colnames(modata) <- x$var2_levels
    rownames(modata) <- x$var1_levels
    cols <- nrow(modata)
    mosaicplot(modata, col = rainbow(cols), off = 5,
               xlab = x$varnames[1], ylab = x$varnames[2],
               main = paste(x$varnames[1], "by", x$varnames[2]))

    # x axis position
    cpr <- ncol(x$row_percent)
    rp <- x$row_percent[, cpr]
    crp <- cumsum(rp)
    lcrp <- length(crp)
    f1 <- (crp[-lcrp] + diff(cumsum(rp)) / 2)
    xpos <- c(rp[1] / 2, f1)

    # y axis position
    nr <- nrow(x$row_percent)
    for (i in seq_len(nr)) {
        rpy <- rev(x$row_percent[i, -cpr])
        crpy <- cumsum(rpy)
        lcrpy <- length(crpy)
        f1 <- (crpy[-lcrpy] + diff(cumsum(rpy)) / 2)
        ypos <- c(rpy[1] / 2, f1)
        text(x = xpos[i], y = ypos, labels = paste(rpy * 100, '%'), cex = 0.6)
    }

    result <- list(data = modata)
    invisible(result)
}
