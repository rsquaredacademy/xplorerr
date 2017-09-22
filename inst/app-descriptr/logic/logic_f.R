output$f_shape <- renderPlot({
  f_plot(input$f_numdf, input$f_dendf, as.logical(input$f_norm))
})

output$fprob_plot <- renderPlot({
  f_prob(input$fprob_p, input$fprob_numdf, input$fprob_dendf, input$fprob_tail)
})

output$fperc_plot <- renderPlot({
  f_per(input$fperc_p, input$fperc_numdf, input$fperc_dendf, input$fperc_tail)
})
