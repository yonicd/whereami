testthat::context("thisfile")

f <- "scripts/thisfile-cat.R"
fcmd <- sprintf('"%s" --slave --vanilla --no-save -f %s', R.home("bin/R"), f)

testthat::test_that("thisfile works with source", {
  testthat::skip_on_cran()
  res <- source("scripts/thisfile.R")
  testthat::expect_true(grepl("thisfile.R$", res$value))
})

testthat::test_that("thisfile works with Rscript", {
  testthat::skip_on_cran()
  p <- pipe(fcmd)
  on.exit(close(p))
  res <- readLines(p)
  testthat::expect_equal(f, res[[length(res)]])
})

testthat::test_that("thisfile works with R", {
  testthat::skip_on_cran()
  p <- pipe(fcmd)
  on.exit(close(p))
  res <- readLines(p)
  testthat::expect_equal(f, res[[length(res)]])
})

testthat::test_that("thisfile works with knitr", {
  testthat::skip_if_not_installed("knitr")
  out <- tempfile(pattern = "whereami", fileext = ".md")
  knitr::knit("scripts/thisfile.Rmd", output = out, quiet = TRUE)
  testthat::expect_equal(
    readLines(out)[3],
    normalizePath("scripts/thisfile.Rmd"),
    fixed = TRUE
  )
})
