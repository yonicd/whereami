testthat::context("source functionality")

whereami::counter_reset()

testthat::describe("source calls", {

  it('direct call',{
    testthat::expect_true(inherits(whereami::whereami(path_expand = FALSE),'whereami'))
  })

  it('path expand',{
    testthat::expect_true(inherits(whereami::whereami(path_expand = TRUE),'whereami'))
  })

  it('print',{
    testthat::expect_output(print(whereami::whereami()),regexp = 'Running')
  })

  whereami::cat_where(whereami::whereami())


})
