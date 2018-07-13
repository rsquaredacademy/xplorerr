library(shiny)
library(shinyBS)
library(shinythemes)
library(descriptr)
library(dplyr)

shinyUI(	
  navbarPage(HTML("Xplorerr - Interactive Data Visualization"), id = 'mainpage',
    source('ui/ui_data.R', local = TRUE)[[1]],
    source('ui/ui_visualize.R', local = TRUE)[[1]],
    source('ui/ui_exit_button.R', local = TRUE)[[1]]
))
