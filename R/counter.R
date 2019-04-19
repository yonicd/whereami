wenv <- new.env()

#' @title whereami counter
#' @description Interact with internal whereami counter
#' @details
#' counter_state returns current hit count for each stored counter,
#' arranged in order of counter initialization.
#'
#' counter_reset will remove all stored counters.
#'
#' @rdname counter
#' @export
counter_state <- function(){

  empty_msg <- 'No active counters'

  e <- wenv

  if(!hasName(x = e,'counter'))
    return(empty_msg)

  if(!length(e$counter))
    return(empty_msg)

  as.numeric(e$counter)

}

#' @rdname counter
#' @export
counter_reset <- function(){
  assign(x = 'counter',value = list(),envir = wenv)
}

#' @importFrom digest digest
bump <- function(obj){

  this <- digest::digest(as.character(obj))

  if(!exists('counter',envir = wenv))
    wenv$counter <- list()

  if(!this %in% names(wenv$counter)){
    wenv$counter[[this]] <- 0
  }

  wenv$counter[[this]] <- wenv$counter[[this]] + 1
}
