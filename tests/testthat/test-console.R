context("console functionality")


testthat::describe("counter calls", {

  it('basic',{
    skip_if_not_rstudio()
    rstudioapi::sendToConsole('x <- whereami()')
    testthat::expect_equal(x,structure('Console',class='whereami'))
  })

})
