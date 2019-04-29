
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/whereami)](https://cran.r-project.org/package=whereami)
[![](https://cranlogs.r-pkg.org/badges/whereami)](https://cran.r-project.org/package=whereami)
[![Travis build
status](https://travis-ci.org/yonicd/whereami.svg?branch=master)](https://travis-ci.org/yonicd/whereami)
[![Coverage
status](https://codecov.io/gh/yonicd/whereami/branch/master/graph/badge.svg)](https://codecov.io/github/yonicd/whereami?branch=master)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2019_04_26-yellowgreen.svg)](http://tinyurl.com/y5c5voy3)
![](https://img.shields.io/badge/clones-103-9cf.svg)
![](https://img.shields.io/badge/views-423-9cf.svg)

# whereami<img src="https://github.com/yonicd/whereami/raw/media/hex/whereami_small.png" align="right" />

The goal of whereami is to reliably find where command is run from.

## Installation

``` r
remotes::install_github("yonicd/whereami")
```

## Example

``` r
library(whereami)
library(ggplot2)
```

### General

``` r
whereami()
#> ── Running From: ./README.Rmd ────────────────────
```

### Plots

``` r

ggplot(iris) + 
  aes(x=Sepal.Length,y=Sepal.Width) + 
  geom_point() + 
  labs(caption = sprintf('sourced from: %s',whereami()))
```

<img src="man/figures/README-plot-1.png" width="100%" />

### Shiny

![](https://github.com/yonicd/whereami/blob/media/whereami_shiny.gif?raw=true)

## Non RStudio session

If you are running a non RStudio script ie from terminal R/Rscript then
the package falls back to `thisfile()`, which has been migrated from
[rprojroot::thisfile()](https://rprojroot.r-lib.org/reference/thisfile.html).

In this case the traceback functionality of `whereami()` to return the
line where the function was sourced is not enabled.
