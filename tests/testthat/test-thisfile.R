testthat::context("thisfile")

testthat::test_that("thisfile works with source", {
  testthat::skip_on_cran()
  res <- source("scripts/thisfile.R")
  testthat::expect_true(grepl("thisfile.R$", res$value))
})

testthat::test_that("thisfile works with Rscript", {
  testthat::skip_on_cran()
  testthat::skip_on_travis()
  p <- pipe("Rscript scripts/thisfile-cat.R")
  on.exit(close(p))
  res <- readLines(p)
  testthat::expect_equal("scripts/thisfile-cat.R", res[[length(res)]])
})

testthat::test_that("thisfile works with R", {
  testthat::skip_on_cran()
  testthat::skip_on_travis()
  p <- pipe("R --slave --vanilla --no-save -f scripts/thisfile-cat.R")
  on.exit(close(p))
  res <- readLines(p)
  testthat::expect_equal("scripts/thisfile-cat.R", res[[length(res)]])
})

testthat::test_that("thisfile works with knitr", {
  testthat::skip_if_not_installed("knitr")
  out <- tempfile(pattern = "rprojroot", fileext = ".md")
  testthat::expect_message(
    knitr::knit("scripts/thisfile.Rmd", output = out, quiet = TRUE),
    normalizePath("scripts/thisfile.Rmd"),
    fixed = TRUE
  )
})

# testthat::test_that("thisfile works with rmarkdown", {
#   testthat::skip_if_not_installed("rmarkdown")
#   testthat::skip_if_not(rmarkdown::pandoc_available())
#
#   out <- tempfile(pattern = "rprojroot", fileext = ".md")
#   testthat::expect_message(
#     rmarkdown::render(
#       "scripts/thisfile.Rmd",
#       output_file = out,
#       output_format = "md_document", quiet = TRUE
#     ),
#     normalizePath("scripts/thisfile.Rmd"),
#     fixed = TRUE
#   )
# })
#
# testthat::test_that("thisfile works with spin", {
#   testthat::skip("TODO")
#   out <- tempfile(pattern = "rprojroot", fileext = ".md")
#   knitr::spin("scripts/thisfile-cat.R", format = "Rmd", precious = TRUE)
#   res <- readLines(out)
#   testthat::expect_equal(normalizePath("scripts/thisfile.Rmd"), normalizePath(res))
# })
#
# testthat::test_that("thisfile works with rendering an R script", {
#   testthat::skip("TODO")
#   out <- tempfile(pattern = "rprojroot", fileext = ".md")
#   rmarkdown::render("scripts/thisfile-cat.R",
#                     output_file = out,
#                     output_format = "md_document", quiet = TRUE
#   )
#   res <- readLines(out)
#   testthat::expect_equal(normalizePath("scripts/thisfile.Rmd"), normalizePath(res))
# })