wenv <- new.env()

#' @title whereami counter
#' @description Interact with internal whereami counter
#' @param item character, name of the counter to access, Default: NULL
#' @details
#'
#' counter_names returns names of the active stored counters.
#'
#' counter_state returns current hit count for item, if NULL then all counters
#'  are returned.
#'
#' counter_reset will remove counter of item, if item is NULL then all counters
#'  are reset.
#'
#' @rdname counter
#' @export
counter_state <- function(item = NULL){

  if(!counter_check())
    return('No active counters')

  ret <- wenv$counter

  if(!is.null(item))
    ret <- ret[[item]]

  ret

}

#' @rdname counter
#' @export
counter_reset <- function(item = NULL){
  if(is.null(item)){
    assign(x = 'counter',value = list(),envir = wenv)
  }else{
    wenv[['counter']][[item]] <- NULL
  }
}

#' @rdname counter
#' @export
counter_names <- function(){
  if(!counter_check())
    return('No active counters')

  names(wenv$counter)
}

counter_check <- function(){

  if(!hasName(x = wenv,'counter'))
    return(FALSE)

  if(!length(wenv$counter))
    return(FALSE)

  TRUE
}

#' @importFrom digest digest
bump <- function(obj){

  this <- as.character(obj)[length(obj)] #digest::digest(as.character(obj))

  if(!exists('counter',envir = wenv))
    wenv$counter <- list()

  if(!this %in% names(wenv$counter)){
    wenv$counter[[this]] <- 0
  }

  wenv$counter[[this]] <- wenv$counter[[this]] + 1
}
