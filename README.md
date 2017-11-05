
<!-- README.md is generated from README.Rmd. Please edit that file -->
xplorerr
========

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/xplorerr)](https://cran.r-project.org/package=xplorerr) [![Travis-CI Build Status](https://travis-ci.org/rsquaredacademy/xplorerr.svg?branch=master)](https://travis-ci.org/rsquaredacademy/xplorerr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/xplorerr?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/xplorerr) [![](https://cranlogs.r-pkg.org/badges/grand-total/xplorerr)](https://cran.r-project.org/package=xplorerr)

Overview
--------

xplorerr provides a set of shiny apps useful for:

-   generating descriptive & summary statistics
-   exploring statistical distributions
-   hypothesis testing
-   data visualization
-   and modeling

Installation
------------

You can install xplorerr from github with:

``` r
# install xplorerr from CRAN
install.packages('xplorerr')

# install.packages("devtools")
devtools::install_github("rsquaredacademy/xplorerr")
```

Usage
-----

There are five apps in xplorerr which can be launched using `launch_app_*` prefix (easy tab completion)

### Descriptive Statistics

``` r
launch_app_descriptr()
```

### Hypothesis Testing

``` r
launch_app_inferr()
```

### Visualization

``` r
launch_app_visualizer()
```

### Model Building

``` r
launch_app_olsrr()
```

### Xplorerr

``` r
launch_app_xplorerr()
```

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
