#' @importFrom shiny runApp
#' @title Launch Xplorerr App
#' @description Launches the xplorerr app
#' @examples
#' \dontrun{
#' launch_app_xplorerr()
#' }
#' @export
#'
launch_app_xplorerr <- function() {
    shiny::runApp(appDir = system.file("app-xplorerr", package = "xplorerr"))
}


#' @title Launch Visualization App
#' @description Launches the Visualizer app
#' @examples
#' \dontrun{
#' launch_app_visualizer()
#' }
#' @export
#'
launch_app_visualizer <- function() {
    shiny::runApp(appDir = system.file("app-visualize", package = "xplorerr"))
}

#' @title Launch Descriptive Statistics App
#' @description Launches the descriptr app
#' @examples
#' \dontrun{
#' launch_app_descriptr()
#' }
#' @export
#'
launch_app_descriptr <- function() {
    shiny::runApp(appDir = system.file("app-descriptr", package = "xplorerr"))
}

#' @title Launch Inferential Statistics App
#' @description Launches the inferr app
#' @examples
#' \dontrun{
#' launch_app_inferr()
#' }
#' @export
#'
launch_app_inferr <- function() {
    shiny::runApp(appDir = system.file("app-inferr", package = "xplorerr"))
}

#' @title Launch OLS Regression App
#' @description Launches the olsrr app
#' @examples
#' \dontrun{
#' launch_app_olsrr()
#' }
#' @export
#'
launch_app_olsrr <- function() {
    shiny::runApp(appDir = system.file("app-olsrr", package = "xplorerr"))
}