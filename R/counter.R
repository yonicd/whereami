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
#' @param tag character, tag of the counter to acces, if it was set at initial whereami call.
#'  This can be used instead of the item name, Default: NULL
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
#'  be plotted with the with the plot method.
#'
#'  A json log of the counter is written to file.path(tempdir(),'whereami.json') by default
#'  The path can be set using [set_whereami_log][whereami::set_whereami_log]
#'
#' @examples
#'
#' tf <- system.file('example.R',package = 'whereami')
#'
#' source(tf)
#'
#' counter_state()
#'
#' counter_state(tag = 'tag1')
#'
#' counter_names()
#'
#' counter_tags()
#'
#' counters <- counter_get()
#'
#' counters
#'
#' # using counter_reset and counter_names in a loop
#'
#' for( i in 1:10 ){
#'
#'   source(tf)
#'
#'   if( counter_state(tag = 'tag1') > 5 )
#'     counter_reset(tag = 'tag2')
#' }
#'
#' plot(counter_get())
#'
#' # read the json log
#' jsonlite::read_json(
#' file.path(tempdir(),'whereami.json'),
#' simplifyVector = TRUE)
#'
#' # clear all counters
#' counter_reset()
#'
#' #verify that there are no active counters
#' counter_state()
#'
#' # cleanup
#' unlink(tf)
#'
#' @rdname counter
#' @author Jonathan Sidi
#' @family counter
#' @export
counter_state <- function(item = NULL, tag = NULL) {

  if (!counter_check()) {
    return("No active counters")
  }

  ret <- wenv$counter

  if( !is.null(tag) & is.null(item) ){
    item <- tag_map(tag)
  }

  if (!is.null(item)) {
    ret <- ret[[item]]
  }

  ret
}

#' @rdname counter
#' @export
counter_reset <- function(item = NULL, tag = NULL) {

  if( !is.null(tag) & is.null(item) ){
    item <- tag_map(tag)
  }

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

#' @rdname counter
#' @export
counter_tags <- function() {
  if (!counter_check()) {
    return("No active counters")
  }

  ret <- wenv$archives[,c('tag','path','where')]

  ret <- unique(ret[nzchar(ret$tag),])

  if(!nrow(ret))
    return("No tags located")

  res <- ret$tag
  names(res) <- file.path(ret$path,ret$where)

  res
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

#' @importFrom jsonlite write_json
bump <- function(obj, tag) {

  this <- as.character(obj)[length(obj)]

  if(is.null(tag))
    tag <- ''

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
      tag = tag,
      where = basename(obj[2]),
      path  = dirname(obj[2]),
      when = as.character(Sys.time()),
      count = wenv$counter[[this]],
      stringsAsFactors = FALSE
    )
  )

  if(!length(wenv$log_dir)){
    set_whereami_log()
  }

  jsonlite::write_json(
    wenv$archives,file.path(wenv$log_dir,'whereami.json'),
    pretty = TRUE,
    auto_unbox = TRUE)
}

#' @rdname counter
#' @export
counter_get <- function(){
  res <- wenv$archives
  class(res) <- c("whereamicounter", class(res))
  return(res)
}

#' @export
#' @importFrom stats aggregate
#' @importFrom graphics barplot legend par
#' @importFrom grDevices gray.colors
plot.whereamicounter <- function(x, ...){

  r <- stats::aggregate(count ~ where, max, data = x)
  r <- r[order(r$count), ]

  r$line <- gsub('^(.*?)#','',r$where)
  r$file <- gsub('#(.*?)$','',r$where)

  r$line <- factor(r$line, levels = unique(r$line))
  r$file <- factor(r$file, levels = unique(r$file))
  r$where <- factor(r$where, levels = unique(r$where))

  cols <- grDevices::gray.colors(20)[seq_along(levels(r$file))]

  graphics::par(oma=c(0, 0, 0, 20))
  graphics::barplot(count ~ file + line,horiz = TRUE, data =r, col = cols)
  graphics::legend(graphics::par('usr')[2], graphics::par('usr')[4], bty='n',
                   xpd=NA, levels(r$file), fill = cols)

}

tag_map <- function(tag){

  data <- wenv$archives

  idx <- which(data$tag%in%tag)

  if(!any(idx))
    stop(sprintf('The tag name %s is not mapped to a counter', tag))

  file.path(data$path[idx[1]],data$where[idx[1]])

}

#' @title Set Log Path
#' @description Set the path to write the counter log as a json
#' @param path character, path to write to, Default: tempdir()
#' @export
#' @rdname set_whereami_log
set_whereami_log <- function(path = tempdir()){

    wenv$log_dir <- normalizePath(path,winslash = '/')

}
