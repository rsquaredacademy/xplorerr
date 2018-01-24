blr_stepwise_selection <- function(model, details = FALSE, ...) UseMethod('blr_stepwise_selection')

blr_stepwise_selection.default <- function(model, details = FALSE, ...) {

  if (!any(class(model) == 'glm')) {
    stop('Please specify a binary logistic regression model.', call. = FALSE)
  }

  if (!is.logical(details)) {
    stop('details must be either TRUE or FALSE', call. = FALSE)
  }

  if (length(model$coefficients) < 3) {
    stop('Please specify a model with at least 2 predictors.', call. = FALSE)
  }

  l          <- mod_sel_data(model)
  nam        <- colnames(attr(model$terms, 'factors'))
  response   <- names(model$model)[1]
  predictors <- nam
  mlen_p     <- length(predictors)
  tech       <- c('addition', 'removal')
  mo         <- glm(paste(response, '~', 1), data = l,
                    family = binomial(link = 'logit'))
  aic_c      <- model_aic(mo)

  cat(format("Stepwise Selection Method", justify = "left", width = 25), "\n")
  cat(rep("-", 25), sep = "", '\n\n')
  cat(format("Candidate Terms:", justify = "left", width = 16), "\n\n")
  for (i in seq_len(length(nam))) {
    cat(paste(i, ".", nam[i]), "\n")
  }
  cat('\n')

  if (details == TRUE) {
    cat(' Step 0: AIC =', aic_c, '\n', paste(response, '~', 1, '\n\n'))
  }

  step      <- 0
  all_step  <- 0
  preds     <- c()
  var_index <- c()
  method    <- c()
  laic      <- c()
  lbic      <- c()
  ldev      <- c()

  cat('\n')
  if (!details) {
    cat('Variables Entered/Removed:', '\n\n')
  }

  while (step < mlen_p) {

    aics <- c()
    bics <- c()
    devs <- c()
    lpds <- length(predictors)

    for (i in seq_len(lpds)) {
      predn   <- c(preds, predictors[i])
      m       <- glm(paste(response, '~', paste(predn, collapse = ' + ')),
                     data = l, family = binomial(link = 'logit'))
      aics[i] <- model_aic(m)
      bics[i] <- model_bic(m)
      devs[i] <- model_deviance(m)

    }

    da  <- data.frame(predictors = predictors, aics = aics, bics = bics,
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


      cat(fc(crayon::bold$green('  Enter New Variables'), w), sep = "", '\n')
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


    minc <- which(aics == min(aics))

    if (aics[minc] < aic_c) {

      aic_c      <- aics[minc]
      preds      <- c(preds, predictors[minc])
      predictors <- predictors[-minc]
      lpds       <- length(predictors)
      method     <- c(method, tech[1])
      lpreds     <- length(preds)
      var_index  <- c(var_index, preds[lpreds])
      step       <- step + 1
      all_step   <- all_step + 1
      maic       <- aics[minc]
      mbic       <- bics[minc]
      mdev       <- devs[minc]
      laic       <- c(laic, maic)
      lbic       <- c(lbic, mbic)
      ldev       <- c(ldev, mdev)

      cat(paste('+', dplyr::last(preds), 'added'), '\n')


      if (details == TRUE) {
        cat('\n\n', 'Step', all_step, ': AIC =', maic, '\n', paste(response, '~', paste(preds, collapse = ' + ')), '\n\n')
      }

      if (lpreds > 1) {

        aics <- c()
        bics <- c()
        devs <- c()

        for (i in seq_len(lpreds)) {

          preda   <- preds[-i]
          m       <- glm(paste(response, '~', paste(preda, collapse = ' + ')),
                         data = l, family = binomial(link = 'logit'))
          aics[i] <- model_aic(m)
          bics[i] <- model_bic(m)
          devs[i] <- model_deviance(m)

        }

        da  <- data.frame(predictors = preds, aics = aics, bics = bics,
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

          cat(fc(crayon::bold$red('Remove Existing Variables'), w), sep = "", '\n')
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


        minc2 <- which(aics == min(aics))


        if (aics[minc2] < laic[all_step]) {

          aic_c     <- aics[minc2]
          maic      <- aics[minc2]
          mbic      <- bics[minc2]
          mdev      <- devs[minc2]
          laic      <- c(laic, maic)
          lbic      <- c(lbic, mbic)
          ldev      <- c(ldev, mdev)
          var_index <- c(var_index, preds[minc2])
          method    <- c(method, tech[2])
          all_step  <- all_step + 1
          
          cat(paste('-', preds[minc2], 'removed'), '\n')

          preds     <- preds[-minc2]
          lpreds    <- length(preds)


          if (details == TRUE) {
            cat('\n\n', 'Step', all_step, ': AIC =', maic, '\n', paste(response, '~', paste(preds, collapse = ' + ')), '\n\n')
          }

        }


      } else {

        preds    <- preds
        all_step <- all_step

      }

    } else {

      cat('\n')
      cat(crayon::bold$red("No more variables to be added or removed."))
      break

    }

  }

  if(details == TRUE) {

    cat('\n\n')
    cat('Final Model Output', '\n')
    cat(rep("-", 18), sep = "", '\n\n')

    fi <- blr_regress(paste(response, '~', paste(preds, collapse = ' + ')),
                      data = l)
    print(fi)

  }

  out <- list(
    candidates = nam,
    predictors = var_index,
    method     = method,
    aic        = laic,
    bic        = lbic,
    dev        = ldev,
    steps      = all_step)

  class(out) <- 'blr_stepwise_selection'

  return(out)

}

print.blr_stepwise_selection <- function(x, ...) {
  if (x$steps > 0) {
    print_stepwise_selection(x)
  } else {
    print('No variables have been added to or removed from the model.')
  }
}
