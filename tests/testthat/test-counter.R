context("counter functionality")

whereami::counter_reset()

testthat::describe("counter flow", {
  it("no counter exists", {
    testthat::expect_false(counter_check())
  })

  skip_if_not_rstudio()

  it("initial", {
    testthat::expect_output(source("scripts/print.R"), "print.R#3 \\(1\\)")
  })

  it("check counter was created", {
    testthat::expect_true(counter_check())
  })

  it("counter name", {
    testthat::expect_equal(counter_names(), "scripts/print.R#3")
  })

  it("counter bump", {
    testthat::expect_output(source("scripts/print.R"), "print.R#3 \\(2\\)")
  })

  it("counter state", {
    testthat::expect_equal(counter_state(), list("scripts/print.R#3" = 2))
  })

  it("cat_whereami", {
    testthat::expect_output(source("scripts/cat.R"), "cat.R#3 \\(1\\)")
  })

  it("multiple counter states", {
    testthat::expect_equal(counter_state(), list("scripts/print.R#3" = 2,
                                                 "scripts/cat.R#3" = 1))
  })

  it("multiple counter names", {
    testthat::expect_equal(counter_names(), c("scripts/print.R#3", "scripts/cat.R#3"))
  })

  it("reset item", {
    counter_reset("scripts/print.R#3")
    testthat::expect_null(counter_state("scripts/print.R#3"))
  })

  it("reset all", {
    counter_reset()
    testthat::expect_false(counter_check())
  })
})

whereami::counter_reset()
