#' @title Launch Visualization App
#' @description Launches the Visualizer app
#' @examples
#' \dontrun{
#' launch_app_visualizer()
#' }
#' @export
#'
launch_app_visualizer <- function() {
  message('Highcharts (www.highcharts.com) is a Highsoft software product which is not free for commercial and Governmental use')
  shiny::runApp(appDir = system.file("app-visualize", package = "xplorerr"))
}

