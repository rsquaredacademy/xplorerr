.onAttach <- function(...) {
  if (!interactive() || stats::runif(1) > 0.1) return()

  tips <- c(
    "Learn more about xplorerr at https://github.com/rsquaredacademy/xplorerr/.",
    "Use suppressPackageStartupMessages() to eliminate package startup messages.",
    "Need help getting started with regression models? Visit: https://www.rsquaredacademy.com",
    "Check out our interactive app for quick data exploration. Visit: https://apps.rsquaredacademy.com/."
  )

  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}
