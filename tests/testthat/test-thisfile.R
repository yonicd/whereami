testthat::context("thisfile")

f <- 'scripts/thisfile-cat.R'
fcmd <- sprintf('"%s" --slave --vanilla --no-save -f %s',file.path(R.home(),'bin/R'),f)

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
