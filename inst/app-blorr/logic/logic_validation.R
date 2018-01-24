source('helpers/model-validation.R')
source('helpers/hosmer-lemeshow-test.R')
source('helpers/gains-table.R')
source('helpers/lorenz-curve.R')

# confusion matrix
conf_result <- eventReactive(input$submit_conf, {
  if (input$conf_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$conf_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_confusion_matrix(k, cutoff = input$conf_cutoff))
})

confusion_title <- eventReactive(input$submit_conf, {
  column(12, align = 'center', h4('Confusion Matrix & Model Performance Measures'))
})

output$conf_title <- renderUI({
  confusion_title()
})


output$conf_out <- renderPrint({
  conf_result()
})


# hosmer lemeshow test
hoslem_result <- eventReactive(input$submit_hoslem, {
  if (input$hoslem_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$hoslem_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_hosmer_lemeshow_test(k))
})

output$hoslem_out <- renderPrint({
  hoslem_result()
})

# gains chart and roc curve
lift_result <- eventReactive(input$submit_lift, {
  if (input$lift_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$lift_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_gains_table(k))
})

gains_title <- eventReactive(input$submit_lift, {
  column(12, align = 'center', h4('Gains Table & Lift Chart'))
})

output$lift_title <- renderUI({
  gains_title()
})

output$gains_table_out <- renderPrint({
  lift_result()
})

output$lift_out <- renderPlot({
	plot(lift_result())
})

# ROC curve
roc_result <- eventReactive(input$submit_roc, {
  if (input$roc_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$roc_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_gains_table(k))
})


output$roc_out <- renderPlot({
	blorr::blr_roc_curve(roc_result())
})

# KS chart
ks_result <- eventReactive(input$submit_ks, {
  if (input$ks_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$ks_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_gains_table(k))
})


output$ks_out <- renderPlot({
	blr_ks_chart(ks_result())
})


# lorenz curve
lorenz_result <- eventReactive(input$submit_lorenz, {
  if (input$lorenz_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$lorenz_fmla, data = data, family = binomial(link = "logit"))
  }
  return(k)
})


output$lorenz_out <- renderPlot({
	blr_lorenz_curve(lorenz_result())
})