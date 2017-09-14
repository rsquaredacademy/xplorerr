#' @importFrom shiny runApp
#' @title Launch App
#' @description Launches the xplorerr app
#' @examples
#' \dontrun{
#' launch_xplorerr()
#' }
#' @export
#'
launch_xplorerr <- function() {
    shiny::runApp(appDir = system.file("application", package = "xplorerr"))
}
