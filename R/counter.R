wenv <- new.env()
wenv$archives <- data.frame(
  where = character(0),
  when = numeric(0),
  count = numeric(0),
  stringsAsFactors = FALSE
)

#' @title whereami counter
#' @description Interact with internal whereami counter
#' @param item character, name of the counter to access, Default: NULL
#' @param counter For autoplot, the output of `counter_get()`
#' @details
#'
#' `counter_names()` returns names of the active stored counters.
#'
#' `counter_state()` returns current hit count for item, if NULL then all counters
#'  are returned.
#'
#' `counter_reset()` will remove counter of item, if item is NULL then all counters
#'  are reset.
#'
#'  `counter_get()` returns a table with all the counters. These can then
#'  be plotted with the `autoplot()` method.
#' @examples
#'
#' if( interactive() ){
#'
#' tf <- tempfile(fileext = '.R')
#'
#' # call to write to temp file
#' f <- 'whereami::cat_where(whereami::whereami())'
#'
#' # write to the file (call at line 3)
#' cat('\n\n',f,sep='',file = tf)
#'
#' source(tf)
#'
#' counter_state()
#'
#' counter_names()
#'
#' # using counter_reset and counter_names in a loop
#'
#' for( i in 1:10 ){
#'
#'   source(tf)
#'
#'   if( counter_state(counter_names()[1]) > 5 )
#'     counter_reset(counter_names()[1])
#' }
#'
#' # clear all counters
#' counter_reset()
#'
#' # cleanup
#' unlink(tf)
#'
#' }
#'
#' @rdname counter
#' @author Jonathan Sidi
#' @family counter
#' @export
counter_state <- function(item = NULL) {
  if (!counter_check()) {
    return("No active counters")
  }

  ret <- wenv$counter

  if (!is.null(item)) {
    ret <- ret[[item]]
  }

  ret
}

#' @rdname counter
#' @export
counter_reset <- function(item = NULL) {
  if (is.null(item)) {
    assign(x = "counter", value = list(), envir = wenv)
  } else {
    wenv[["counter"]][[item]] <- NULL
  }
}

#' @rdname counter
#' @export
counter_names <- function() {
  if (!counter_check()) {
    return("No active counters")
  }

  names(wenv$counter)
}

#' @importFrom utils hasName
counter_check <- function() {
  if (!utils::hasName(x = wenv, "counter")) {
    return(FALSE)
  }

  if (!length(wenv$counter)) {
    return(FALSE)
  }

  TRUE
}

bump <- function(obj) {
  this <- as.character(obj)[length(obj)]

  if (!exists("counter", envir = wenv)) {
    wenv$counter <- list()
  }

  if (!this %in% names(wenv$counter)) {
    wenv$counter[[this]] <- 0
  }

  wenv$counter[[this]] <- wenv$counter[[this]] + 1

  wenv$archives <- rbind(
    wenv$archives,
    data.frame(
      where = basename(obj[2]),
      when = as.character(Sys.time()),
      count = wenv$counter[[this]],
      stringsAsFactors = FALSE
    )
  )
}

#' @rdname counter
#' @export
counter_get <- function(){
  res <- wenv$archives
  class(res) <- c("whereamicounter", class(res))
  return(res)
}

#' @rdname counter
#' @export
#' @importFrom stats setNames
autoplot.whereamicounter <- function(counter){
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("`autoplot()` requires {ggplot2}")
  }
  r <- setNames(
    as.data.frame(
      table(
        counter$where
      )
    ),
    c("where", "count")
  )
  r <- r[order(r$count), ]
  r$where <- factor(r$where, levels = r$where)
  ggplot2::ggplot(r, ggplot2::aes(where, count)) +
    ggplot2::geom_col() +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal()

}

utils::globalVariables(c("where", "count"))
