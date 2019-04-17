wenv <- new.env()


#' @title Reset the internal counter
#' @description Reset the internal counter for whereami to an empty list
#' @return NULL
#' @rdname reset_whereami
#' @export
reset_whereami <- function(){
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
