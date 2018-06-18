output$chisq_shape <- renderPlot({
  dist_chi_plot(input$chisq_df, as.logical(input$chisq_norm))
})

output$chiprob_plot <- renderPlot({
  dist_chi_prob(input$chiprob_p, input$chiprob_df, input$chiprob_tail)
})

output$chiperc_plot <- renderPlot({
  dist_chi_perc(input$chiperc_p, input$chiperc_df, input$chiperc_tail)
})
