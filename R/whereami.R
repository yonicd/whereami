#' @title Return where the script is run from
#' @description Returns the file that a command is run from. If traceback is available
#'   then the line that it was run from is also returned.
#' @param path_expand logical, expand relational path, Default: FALSE
#' @param counter logical, remember where whereami last ran and increase the
#'   internal counter by 1, Default: FALSE
#' @return character
#' @details does not work currently on rmd render
#' @examples
#' \dontrun{
#' if(interactive()){
#'  whereami()
#'  whereami(path_expand = TRUE)
#'  }
#' }
#' @seealso
#'  \code{\link[rstudioapi]{rstudio-editors}}
#' @rdname whereami
#' @export
#' @importFrom rstudioapi getActiveDocumentContext isAvailable
#' @importFrom utils getSrcDirectory getSrcFilename
#' @importFrom rprojroot thisfile
whereami <- function(path_expand = FALSE,counter = FALSE){

  if(!counter){
    reset_counter()
  }

  tf <- tempfile()

  on.exit({
    if(counter){
      bump(ret)
    }
    unlink(tf)
    },add = TRUE)

  cmd <- commandArgs(trailingOnly = FALSE)

  if(any('RStudio'%in%cmd)){

    src <- 'Untitled'

    adc <- rstudioapi::getActiveDocumentContext()

    if(adc$id=='#console')
      src <- 'Console'

    if(nchar(adc$path)>0)
      src <- path.expand(adc$path)

    if(length(getSrcFilename(sys.call(sys.nframe()-1)))>0){

        if(nchar(getSrcFilename(sys.call(sys.nframe()-1)))>0){

          src <- file.path(
            utils::getSrcDirectory(sys.call(sys.nframe()-1)),
            utils::getSrcFilename(sys.call(sys.nframe()-1))
          )

          src <- gsub('^\\.',getwd(),src)
        }

    }

    if(!path_expand)
      src <- gsub(getwd(),'.',src)

    cat(src,file = tf,sep='\n')

    refloc <- crumb()

    if(!is.null(refloc))
      cat(refloc,file = tf,sep='\n',append = TRUE)

  }else{

    src <- normalizePath(rprojroot::thisfile())

    if(!path_expand)
      src <- gsub(getwd(),'.',src)

    if(!is.null(src))
      cat(src,file = tf,sep='\n',append = TRUE)

    return(readLines(tf))
  }

  ret <- readLines(tf)

  structure(ret,class = c('whereami'))

}

wenv <- new.env()


#' @title Reset the internal counter
#' @description Reset the internal counter for whereami to an empty list
#' @return NULL
#' @rdname reset_counter
#' @export
reset_counter <- function(){
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
