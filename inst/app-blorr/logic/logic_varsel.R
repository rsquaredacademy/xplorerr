source('helpers/backward-elimination.R')
source('helpers/forward-selection.R')
source('helpers/stepwise-selection.R')

model_be <- eventReactive(input$submit_varsel_be, {
  data <- final_split$train
  m <- glm(input$varsel_be_fmla, data = data, family = binomial(link = "logit"))
  k <- blr_backward_elimination(m, details = as.logical(input$trace_varsel_be))
  k
})

output$regress_varsel_be <- renderPrint({
  model_be()
})


model_fe <- eventReactive(input$submit_varsel_fe, {
  data <- final_split$train
  m <- glm(input$varsel_fe_fmla, data = data, family = binomial(link = "logit"))
  k <- blr_forward_selection(m, details = as.logical(input$trace_varsel_fe))
  k
})

output$regress_varsel_fe <- renderPrint({
  model_fe()
})


model_se <- eventReactive(input$submit_varsel_se, {
  data <- final_split$train
  m <- glm(input$varsel_se_fmla, data = data, family = binomial(link = "logit"))
  k <- blr_stepwise_selection(m, details = as.logical(input$trace_varsel_se))
  k
})

output$regress_varsel_se <- renderPrint({
  model_se()
})
