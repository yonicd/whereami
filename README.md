
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

![](https://github.com/yonicd/whereami/blob/misc/misc/base_example.gif?raw=true)

### Interactive Rmd

``` r
whereami()
#> [1] "./README.Rmd"
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

![](https://github.com/yonicd/whereami/blob/misc/misc/shiny_example.gif?raw=true)
