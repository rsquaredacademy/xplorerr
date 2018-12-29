#' @title Visualization 
#' @description Launches the visualizer app.
#' @examples
#' \dontrun{
#' app_visualizer()
#' }
#' @export
#'
app_visualizer <- function() {
  message('Highcharts (www.highcharts.com) is a Highsoft software product which is not free for commercial and Governmental use')
  shiny::runApp(appDir = system.file("app-visualize", package = "xplorerr"))
}

#' @title Descriptive Statistics
#' @description Launches the descriptive statistics app.
#' @examples
#' \dontrun{
#' app_descriptive()
#' }
#' @export
#'
app_descriptive <- function() {
  shiny::runApp(appDir = system.file("app-descriptr", package = "xplorerr"))
}

#' @title Visualize distributions
#' @description Launches app for visualizing probability distributions.
#' @examples
#' \dontrun{
#' app_descriptive()
#' }
#' @export
#'
app_vistributions <- function() {
  shiny::runApp(appDir = system.file("app-vistributions", package = "xplorerr"))
}


#' @title Inferential Statistics
#' @description Launches the inferential statistics app.
#' @examples
#' \dontrun{
#' app_inference()
#' }
#' @export
#'
app_inference <- function() {
  shiny::runApp(appDir = system.file("app-inferr", package = "xplorerr"))
}

#' @title Linear Regression
#' @description Launches the linear regression app.
#' @examples
#' \dontrun{
#' app_linear_regression()
#' }
#' @export
#'
app_linear_regression <- function() {
  shiny::runApp(appDir = system.file("app-olsrr", package = "xplorerr"))
}

#' @title Logistic Regression
#' @description Launches the logistic regression app.
#' @examples
#' \dontrun{
#' app_logistic_regression()
#' }
#' @export
#'
app_logistic_regression <- function() {
  shiny::runApp(appDir = system.file("app-blorr", package = "xplorerr"))
}

#' @title RFM Analysis
#' @description Launches the RFM analyssi app.
#' @examples
#' \dontrun{
#' app_rfm_analysis()
#' }
#' @export
#'
app_rfm_analysis <- function() {
  shiny::runApp(appDir = system.file("app-rfm", package = "xplorerr"))
}




