
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis build
status](https://travis-ci.org/yonicd/whereami.svg?branch=master)](https://travis-ci.org/yonicd/whereami)[![Coverage
status](https://codecov.io/gh/yonicd/whereami/branch/master/graph/badge.svg)](https://codecov.io/github/yonicd/whereami?branch=master)[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2019_04_20-brightgreen.svg)](http://tinyurl.com/y5c5voy3)

# whereami

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

<!-- ![](https://github.com/yonicd/whereami/blob/misc/misc/base_example.gif?raw=true) -->

### Interactive Rmd

``` r
whereami()
#> ── Running From: ./README.Rmd ────────────────────────────────────────────────────────────────────────────
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
the package falls back to
[rprojroot::thisfile()](https://rprojroot.r-lib.org/reference/thisfile.html).
In this case the traceback functionality of `whereami` to return the
line where `whereami()` was sourced is not enabled.
