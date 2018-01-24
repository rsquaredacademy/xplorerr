
<!-- README.md is generated from README.Rmd. Please edit that file -->

## xplorerr: Shiny Apps for Interactive Analysis <img src="xplorerr.png" align="right" />

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/xplorerr)](https://cran.r-project.org/package=xplorerr)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/xplorerr.svg?branch=master)](https://travis-ci.org/rsquaredacademy/xplorerr)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/xplorerr?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/xplorerr)
[![](https://cranlogs.r-pkg.org/badges/grand-total/xplorerr)](https://cran.r-project.org/package=xplorerr)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

## Overview

xplorerr provides a set of shiny apps useful for:

  - generating descriptive & summary statistics
  - exploring statistical distributions
  - hypothesis testing
  - data visualization
  - and modeling

## Installation

You can install xplorerr from github with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/xplorerr")
```

## Usage

There are six apps in xplorerr which can be launched using
`launch_app_*` prefix (easy tab completion).

### Descriptive Statistics

Useful for generating descriptive/summary statistics and exploring
distributions.

``` r
launch_app_descriptr()
```

### Hypothesis Testing

Useful for performing parametric and non-parametric tests.

``` r
launch_app_inferr()
```

### Visualization

Visualize data using different libraries such as ggplot2, plotly and
rbokeh.

``` r
launch_app_visualizer()
```

### Linear Regression

Build linear regression models using OLS technique.

``` r
launch_app_olsrr()
```

### Logistic Regression

Build and validate binary logistic regression models.

``` r
launch_app_blorr()
```

### Xplorerr

Single app that includes all of the above.

``` r
launch_app_xplorerr()
```

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
