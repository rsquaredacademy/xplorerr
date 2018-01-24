source('helpers/utils.R')
source('helpers/output.R')

blr_confusion_matrix <- function(model, cutoff = 0.5, data = NULL) UseMethod('blr_confusion_matrix')

blr_confusion_matrix.default <- function(model, cutoff = 0.5, data = NULL) {

  if (is.null(data)) {
    data <- model %>%
      use_series(data)
  }

  resp <- model %>%
    formula %>%
    extract2(2) %>%
    as.character

  conf_matrix <- data %>%
    mutate(
      prob = predict.glm(object = model, type = 'response'),
      predicted = if_else(prob > cutoff, 1, 0)
    ) %>%
    select(resp, predicted) %>%
    table

  a <- conf_matrix[4]
  b <- conf_matrix[3]
  c <- conf_matrix[2]
  d <- conf_matrix[1]
  abcd <- sum(a, b, c ,d)

  accuracy <- (a + d) / abcd
  precision <- a / (a + b)
  recall <- a / (a + c)
  sensitivity <- a / (a + c)
  specificity <- d / (d + b)
  prevalence <- (a + c) / abcd
  detection_rate <- a / abcd
  detection_prevalence <- (a + b) / abcd
  balanced_accuracy <- (sensitivity + specificity) / 2

  ppv <- (sensitivity * prevalence) / ((sensitivity * prevalence) +
                                         ((1 - specificity) * (1 - prevalence)))
  npv <- (specificity * (1 - prevalence)) / (((1 - sensitivity) * prevalence) +
                                               (specificity * (1 - prevalence)))


  result <- list(
    confusion_matrix = conf_matrix,
    accuracy = accuracy,
    precision = precision,
    sensitivity = sensitivity,
    specificity = specificity,
    recall = recall,
    prevalence = prevalence,
    detection_rate = detection_rate,
    detection_prevalence = detection_prevalence,
    balanced_accuracy = balanced_accuracy,
    pos_pred_value = ppv,
    neg_pred_value = npv
  )

  class(result) <- 'blr_confusion_matrix'
  return(result)

}

print.blr_confusion_matrix <- function(x, ...) {

  print_blr_confusion_matrix(x)

}






