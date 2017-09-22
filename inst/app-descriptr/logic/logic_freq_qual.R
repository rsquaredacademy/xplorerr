source('helper/freq-cat.R')


# observe({
#     updateSelectInput(session,
#                       inputId = "var_table",
#                       choices = names(data()),
#                       selected = '')
# })

observeEvent(input$finalok, {
    num_data <- final_split$train[, sapply(final_split$train, is.factor)]
    if (is.null(dim(num_data))) {
      k <- final_split$train %>% map(is.factor) %>% unlist()
      j <- names(which(k == TRUE))
      f_data <- tibble::as_data_frame(num_data)
      colnames(f_data) <- j
      updateSelectInput(session,
                        inputId = "var_table",
                        choices = names(f_data))
    } else {
      updateSelectInput(session,
                      inputId = "var_table",
                      choices = names(num_data))

    }  
})

observeEvent(input$submit_part_train_per, {
    num_data <- final_split$train[, sapply(final_split$train, is.factor)]
    if (is.null(dim(num_data))) {
      k <- final_split$train %>% map(is.factor) %>% unlist()
      j <- names(which(k == TRUE))
      f_data <- tibble::as_data_frame(num_data)
      colnames(f_data) <- j
      updateSelectInput(session,
                        inputId = "var_table",
                        choices = names(f_data))
    } else {
      updateSelectInput(session,
                      inputId = "var_table",
                      choices = names(num_data))

    }  
})

# selected data
d_freq_qual <- eventReactive(input$submit_fqual, {
	# validate(need(input$var_table != '', 'Please select a variable.'))
    data <- final_split$train[, c(input$var_table)]
    fdata <- as.data.frame(data)
    names(fdata) <- input$var_table
    fdata
})

fqual_out <- eventReactive(input$submit_fqual, {
  ki <- freq_table(d_freq_qual(), as.character(input$var_table))
  ki
})

f1_title <- eventReactive(input$submit_fqual, {
  h3('Frequency Table')
})

output$freq1_title <- renderUI({
  f1_title()
})

# output
output$freq_qual <- renderPrint({
  fqual_out()
})

output$qual_vert <- renderPlot({
    barplot(fqual_out())
})

# output$qual_horiz <- renderPlot({
#     ki <- freq_table(fil_qual_data())
#     j <- as.numeric(ki$ftable[, 2])
#     h <- j
#     ymax <- max(h)
#     cols <- length(j)
#     x_names <- ki$ftable[, 1]
#     k <- barplot(j, col = topo.colors(cols), horiz = T,
#                  main = paste('Bar Plot of', input$name_freq_qual),
#                  xlab = 'Frequency',
#                  ylab = input$name_freq_qual,
#                  names.arg = x_names)

# })
