context("console functionality")

testthat::describe("console functionality", {

  skip_if_not_rstudio()
  rstudioapi::sendToConsole('x <- whereami()')

  it('class',{
    testthat::expect_true(inherits(x,'whereami'))
  })

  it('value',{
    testthat::expect_equal(basename(x[1]),"Console")
  })

})
