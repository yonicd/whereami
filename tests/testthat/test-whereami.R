context("counter functionality")


testthat::describe("counter flow", {

  it("no counter exists", {
    testthat::expect_false(counter_check())
  })

  skip_if_not_rstudio()

  it('initial',{
    testthat::expect_output(source('foo.R'),'foo.R#4 \\(1\\)')
  })

  it('check counter was created',{
    testthat::expect_true(counter_check())
  })

  it('counter name',{
    testthat::expect_equal(counter_names(),'foo.R#4')
  })

  it('counter bump',{
    testthat::expect_output(source('foo.R'),'foo.R#4 \\(2\\)')
  })

  it('counter state',{
    testthat::expect_equal(counter_state(),list('foo.R#4' = 2))
  })

  it('reset',{
    counter_reset('foo.R#4')
    testthat::expect_false(counter_check())
  })

})
