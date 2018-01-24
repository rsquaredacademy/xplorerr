.onAttach <- function(...) {
  if (!interactive() || stats::runif(1) > 0.1) return()

  tips <- c(
    "Learn more about xplorerr at http://github.com/rsquaredacademy/xplorerr/.",
    "Use suppressPackageStartupMessages() to eliminate package startup messages.",
    "Need help getting started with data science? Visit: http://www.rsquaredacademy.com"
  )

  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}
