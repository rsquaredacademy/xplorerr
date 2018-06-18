output$t_shape <- renderPlot({
  dist_t_plot(input$t_df)
})

output$tprob_plot <- renderPlot({
  dist_t_prob(input$tprob_p, input$tprob_df, input$tprob_tail)
})

output$tperc_plot <- renderPlot({
  dist_t_perc(input$tperc_p, input$tperc_df, input$tperc_tail)
})
