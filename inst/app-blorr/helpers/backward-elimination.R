blr_backward_elimination <- function(model, details = FALSE, ...) UseMethod('blr_backward_elimination')

blr_backward_elimination.default <- function(model, details = FALSE, ...) {

  if (!any(class(model) == 'glm')) {
    stop('Please specify a binary logistic regression model.', call. = FALSE)
  }

  if (!is.logical(details)) {
    stop('details must be either TRUE or FALSE', call. = FALSE)
  }

  if (length(model$coefficients) < 3) {
    stop('Please specify a model with at least 2 predictors.', call. = FALSE)
  }

  l        <- mod_sel_data(model)
  nam      <- colnames(attr(model$terms, 'factors'))
  response <- names(model$model)[1]
  preds    <- nam
  aic_f    <- model_aic(model)
  mi       <- glm(paste(response, '~', paste(preds, collapse = ' + ')),
                  data = l, family = binomial(link = 'logit'))
  laic     <- aic_f
  lbic     <- model_bic(mi)
  ldev     <- model_deviance(mi)

  cat(format("Backward Elimination Method", justify = "left", width = 27), "\n")
  cat(rep("-", 27), sep = "", '\n\n')
  cat(format("Candidate Terms:", justify = "left", width = 16), "\n\n")
  for (i in seq_len(length(nam))) {
    cat(paste(i, ".", nam[i]), "\n")
  }
  cat('\n')

  if (details == TRUE) {
    cat(' Step 0: AIC =', aic_f, '\n', paste(response, '~', paste(preds, collapse = ' + '), '\n\n'))
  }

  ilp   <- length(preds)
  end   <- FALSE
  step  <- 0
  rpred <- c()
  aics  <- c()
  bics  <- c()
  devs  <- c()

  for (i in seq_len(ilp)) {

    predictors <- preds[-i]
    m          <- glm(paste(response, '~', paste(predictors, collapse = ' + ')),
                      data = l, family = binomial(link = 'logit'))
    aics[i]    <- model_aic(m)
    bics[i]    <- model_bic(m)
    devs[i]    <- model_deviance(m)
  }

  da  <- data.frame(predictors = preds, aics = aics, bics = bics, devs = devs)
  da2 <- arrange(da, aics)

  if(details == TRUE) {

    w1 <- max(nchar('Predictor'), nchar(predictors))
    w2 <- 2
    w3 <- max(nchar('AIC'), nchar(format(round(aics, 3), nsmall = 3)))
    w4 <- max(nchar('BIC'), nchar(format(round(bics, 3), nsmall = 3)))
    w5 <- max(nchar('Deviance'), nchar(format(round(devs, 3), nsmall = 3)))
    w  <- sum(w1, w2, w3, w4, w5, 16)
    ln <- length(aics)

    cat(rep("-", w), sep = "", '\n')
    cat(fl('Variable', w1), fs(), fc('DF', w2), fs(), fc('AIC', w3), fs(),
        fc('BIC', w4), fs(), fc('Deviance', w5), '\n')
    cat(rep("-", w), sep = "", '\n')

    for (i in seq_len(ln)) {
      cat(fl(da2[i, 1], w1), fs(), fc(1, w2), fs(),
          fg(format(round(da2[i, 2], 3), nsmall = 3), w3), fs(),
          fg(format(round(da2[i, 3], 3), nsmall = 3), w4), fs(),
          fg(format(round(da2[i, 4], 3), nsmall = 3), w5), '\n')
    }

    cat(rep("-", w), sep = "", '\n\n')
  }

  cat('\n')
  if (!details) {
    cat('Variables Removed:', '\n\n')
  }

  while (!end) {

    minc <- which(aics == min(aics))

    if (aics[minc] < aic_f) {

      rpred <- c(rpred, preds[minc])
      preds <- preds[-minc]
      ilp   <- length(preds)
      step  <- step + 1
      aic_f <- aics[minc]
      mi    <- glm(paste(response, '~', paste(preds, collapse = ' + ')),
                   data = l, family = binomial(link = 'logit'))
      laic  <- c(laic, aic_f)
      lbic  <- c(lbic, model_bic(mi))
      ldev  <- c(ldev, model_deviance(mi))
      aics  <- c()
      bics  <- c()
      devs  <- c()

      
      cat(paste('-', dplyr::last(rpred)), '\n')
    


      for (i in seq_len(ilp)) {

        predictors <- preds[-i]
        m          <- glm(paste(response, '~', paste(predictors, collapse = ' + ')),
                          data = l, family = binomial(link = 'logit'))
        aics[i]    <- model_aic(m)
        bics[i]    <- model_bic(m)
        devs[i]    <- model_deviance(m)
      }


      if (details == TRUE) {
        cat('\n\n', ' Step', step, ': AIC =', aic_f, '\n', paste(response, '~', paste(preds, collapse = ' + '), '\n\n'))


        da  <- data.frame(predictors = preds, aics = aics, bics = bics,
                          devs = devs)
        da2 <- arrange(da, aics)
        w1  <- max(nchar('Predictor'), nchar(predictors))
        w2  <- 2
        w3  <- max(nchar('AIC'), nchar(format(round(aics, 3), nsmall = 3)))
        w4  <- max(nchar('BIC'), nchar(format(round(bics, 3), nsmall = 3)))
        w5  <- max(nchar('Deviance'), nchar(format(round(devs, 3), nsmall = 3)))
        w   <- sum(w1, w2, w3, w4, w5, 16)
        ln  <- length(aics)

        cat(rep("-", w), sep = "", '\n')
        cat(fl('Variable', w1), fs(), fc('DF', w2), fs(), fc('AIC', w3), fs(),
            fc('BIC', w4), fs(), fc('Deviance', w5), '\n')
        cat(rep("-", w), sep = "", '\n')

        for (i in seq_len(ln)) {
          cat(fl(da2[i, 1], w1), fs(), fc(1, w2), fs(),
              fg(format(round(da2[i, 2], 3), nsmall = 3), w3), fs(),
              fg(format(round(da2[i, 3], 3), nsmall = 3), w4), fs(),
              fg(format(round(da2[i, 4], 3), nsmall = 3), w5), '\n')
        }

        cat(rep("-", w), sep = "", '\n\n')

      }

    } else {

      end <- TRUE

      if (details == TRUE) {
        cat(crayon::bold$red("No more variables to be removed."))
      }

    }

  }

  if(details == TRUE) {

    cat('\n\n')
    cat('Variables Removed:', '\n\n')
    for (i in seq_len(length(rpred))) {
      cat(paste('-', rpred[i]), '\n')
    }

    cat('\n\n')
    cat('Final Model Output', '\n')
    cat(rep("-", 18), sep = "", '\n\n')

    fi <- blr_regress(paste(response, '~', paste(preds, collapse = ' + ')),
                      data = l)
    print(fi)

  }

  out <- list(
    candidates = nam,
    steps      = step,
    predictors = rpred,
    aics       = laic,
    bics       = lbic,
    devs       = ldev)

  class(out) <- 'blr_backward_elimination'

  return(out)


}


print.blr_backward_elimination <- function(x, ...) {
  if (x$steps > 0) {
    print_backward_elimination(x)
  } else {
    print('No variables have been removed from the model.')
  }

}
