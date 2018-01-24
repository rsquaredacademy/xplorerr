blr_forward_selection <- function(model, details = FALSE, ...)
  UseMethod('blr_forward_selection')

blr_forward_selection.default <- function(model, details = FALSE, ...) {

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
  all_pred <- nam
  mlen_p   <- length(all_pred)
  preds    <- c()
  step     <- 1
  aics     <- c()
  bics     <- c()
  devs     <- c()
  mo       <- glm(paste(response, '~', 1), data = l,
                  family = binomial(link = 'logit'))
  aic1     <- model_aic(mo)

  cat(format("Forward Selection Method", justify = "left", width = 24), "\n")
  cat(rep("-", 24), sep = "", '\n\n')
  cat(format("Candidate Terms:", justify = "left", width = 16), "\n\n")
  for (i in seq_len(length(nam))) {
    cat(paste(i, ".", nam[i]), "\n")
  }
  cat('\n')

  if (details == TRUE) {
    cat(' Step 0: AIC =', aic1, '\n', paste(response, '~', 1, '\n\n'))
  }

  for (i in seq_len(mlen_p)) {
    predictors <- all_pred[i]
    k          <- glm(paste(response, '~', paste(predictors, collapse = ' + ')),
                      data = l, family = binomial(link = 'logit'))
    aics[i]    <- model_aic(k)
    bics[i]    <- model_bic(k)
    devs[i]    <- model_deviance(k)
  }

  da  <- data.frame(predictors = all_pred, aics = aics, bics = bics,
                    devs = devs)
  da2 <- arrange(da, aics)

  if(details == TRUE) {

    w1  <- max(nchar('Predictor'), nchar(as.character(da2$predictors)))
    w2  <- 2
    w3  <- max(nchar('AIC'), nchar(format(round(aics, 3), nsmall = 3)))
    w4  <- max(nchar('BIC'), nchar(format(round(bics, 3), nsmall = 3)))
    w5  <- max(nchar('Deviance'), nchar(format(round(devs, 3), nsmall = 3)))
    w   <- sum(w1, w2, w3, w4, w5, 16)
    ln  <- length(aics)

    cat(rep("-", w), sep = "", '\n')
    cat(fl('Variable', w1), fs(), fc('DF', w2), fs(), fc('AIC', w3), fs(),
        fc('BIC', w4), fs(),  fc('Deviance', w5), '\n')
    cat(rep("-", w), sep = "", '\n')

    for (i in seq_len(ln)) {
      cat(fl(da2[i, 1], w1), fs(), fg(1, w2), fs(),
          fg(format(round(da2[i, 2], 3), nsmall = 3), w3), fs(),
          fg(format(round(da2[i, 3], 3), nsmall = 3), w4), fs(),
          fg(format(round(da2[i, 4], 3), nsmall = 3), w5), '\n')
    }

    cat(rep("-", w), sep = "", '\n\n')

  }

  minc     <- which(aics == min(aics))
  laic     <- aics[minc]
  lbic     <- bics[minc]
  ldev     <- devs[minc]
  preds    <- all_pred[minc]
  lpreds   <- length(preds)
  all_pred <- all_pred[-minc]
  len_p    <- length(all_pred)
  step     <- 1

  cat('\n')
  if (!details) {
    cat('Variables Entered:', '\n\n')
  }

  cat(paste('+', dplyr::last(preds)), '\n')

  while (step < mlen_p) {

    aics <- c()
    bics <- c()
    devs <- c()
    mo   <- glm(paste(response, '~', paste(preds, collapse = ' + ')), data = l,
                family = binomial(link = 'logit'))
    aic1 <- model_aic(mo)

    if (details == TRUE) {
      cat('\n\n', 'Step', step, ': AIC =', aic1, '\n', paste(response, '~', paste(preds, collapse = ' + '), '\n\n'))
    }

    for (i in seq_len(len_p)) {
      predictors <- c(preds, all_pred[i])
      k          <- glm(paste(response, '~', paste(predictors, collapse = ' + ')),
                        data = l, family = binomial(link = 'logit'))
      aics[i]    <- model_aic(k)
      bics[i]    <- model_bic(k)
      devs[i]    <- model_deviance(k)
    }

    if (details == TRUE) {

      da  <- data.frame(predictors = all_pred, aics = aics, bics = bics,
                        devs = devs)
      da2 <- arrange(da, aics)
      w1  <- max(nchar('Predictor'), nchar(as.character(da2$predictors)))
      w2  <- 2
      w3  <- max(nchar('AIC'), nchar(format(round(aics, 3), nsmall = 3)))
      w4  <- max(nchar('BIC'), nchar(format(round(bics, 3), nsmall = 3)))
      w5  <- max(nchar('Deviance'), nchar(format(round(devs, 3), nsmall = 3)))
      w   <- sum(w1, w2, w3, w4, w5, 16)
      ln  <- length(aics)

      cat(rep("-", w), sep = "", '\n')
      cat(fl('Variable', w1), fs(), fc('DF', w2), fs(), fc('AIC', w3), fs(),
          fc('BIC', w4), fs(),  fc('Deviance', w5), '\n')
      cat(rep("-", w), sep = "", '\n')

      for (i in seq_len(ln)) {
        cat(fl(da2[i, 1], w1), fs(), fg(1, w2), fs(),
            fg(format(round(da2[i, 2], 3), nsmall = 3), w3), fs(),
            fg(format(round(da2[i, 3], 3), nsmall = 3), w4), fs(),
            fg(format(round(da2[i, 4], 3), nsmall = 3), w5), '\n')
      }

      cat(rep("-", w), sep = "", '\n\n')

    }

    minaic <- which(aics == min(aics))

    if (aics[minaic] < laic[lpreds]) {

      preds    <- c(preds, all_pred[minaic])
      minc     <- aics[minaic]
      laic     <- c(laic, minc)
      lbic     <- c(lbic, minc)
      ldev     <- c(ldev, minc)
      lpreds   <- length(preds)
      all_pred <- all_pred[-minaic]
      len_p    <- length(all_pred)
      step     <- step + 1

      cat(paste('+', dplyr::last(preds)), '\n')


    } else {

      if (details == TRUE) {
        message("No more variables to be added.\n\n")
      }

      break

    }


  }

  if(details == TRUE) {

    cat('\n\n')
    cat('Variables Entered:', '\n\n')
    for (i in seq_len(length(preds))) {
      cat(paste('+', preds[i]), '\n')
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
    steps = step,
    predictors = preds,
    aics = laic,
    bics = lbic,
    devs = ldev)

  class(out) <- 'blr_forward_selection'

  return(out)

}

print.blr_forward_selection <- function(x, ...) {
  if (x$steps > 0) {
    print_forward_selection(x)
  } else {
    print('No variables have been added to the model.')
  }
}
