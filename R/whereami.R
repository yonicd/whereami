#' @title Return where the script is run from
#' @description Returns the file that a command is run from.
#'
#' If traceback is available then the line that it was run from is also returned.
#' @param path_expand logical, expand relational path, Default: FALSE
#' @return character
#' @details does not work currently on rmd render
#' @examples
#' \dontrun{
#'  whereami()
#'  whereami(path_expand = TRUE)
#' }
#' @rdname whereami
#' @export
#' @importFrom rstudioapi getActiveDocumentContext isAvailable
#' @importFrom utils getSrcDirectory getSrcFilename
#' @importFrom rprojroot thisfile
whereami <- function(path_expand = FALSE){

  tf <- tempfile()

  on.exit({

    if(length(ret)>1)
      bump(ret)

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

  }

  ret <- readLines(tf)

  structure(ret,class = c('whereami'))

}
