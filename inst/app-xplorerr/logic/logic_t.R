output$t_shape <- renderPlot({
  t_plot(input$t_df)
})

output$tprob_plot <- renderPlot({
  t_prob(input$tprob_p, input$tprob_df, input$tprob_tail)
})

output$tperc_plot <- renderPlot({
  t_per(input$tperc_p, input$tperc_df, input$tperc_tail)
})
