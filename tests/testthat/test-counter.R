context("counter functionality")


testthat::describe("counter flow", {

  it("no counter exists", {
    testthat::expect_false(counter_check())
  })

  skip_if_not_rstudio()

  it('initial',{
    testthat::expect_output(source('print.R'),'print.R#4 \\(1\\)')
  })

  it('check counter was created',{
    testthat::expect_true(counter_check())
  })

  it('counter name',{
    testthat::expect_equal(counter_names(),'print.R#4')
  })

  it('counter bump',{
    testthat::expect_output(source('print.R'),'print.R#4 \\(2\\)')
  })

  it('counter state',{
    testthat::expect_equal(counter_state(),list('print.R#4' = 2))
  })

  it('cat_whereami',{
    testthat::expect_output(source('cat.R'),'cat.R#3 \\(1\\)')
  })

  it('multiple counter states',{
    testthat::expect_equal(counter_state(),list('print.R#4' = 2,'cat.R#3' = 1))
  })

  it('multiple counter names',{
    testthat::expect_equal(counter_names(),c('print.R#4','cat.R#3'))
  })

  it('reset item',{
    counter_reset('print.R#4')
    testthat::expect_null(counter_state('print.R#4'))
  })

  it('reset all',{
    counter_reset()
    testthat::expect_false(counter_check())
  })

})
