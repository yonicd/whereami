#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param path_expand PARAM_DESCRIPTION, Default: FALSE
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rstudioapi]{rstudio-editors}}
#' @rdname whereami
#' @export
#' @importFrom rstudioapi getActiveDocumentContext
whereami <- function(path_expand = FALSE){

  adc <- rstudioapi::getActiveDocumentContext()

  src <- 'Untitled'

  if(adc$id=='#console')
    src <- 'Console'

  if(length(getSrcFilename(sys.call(sys.nframe()-1)))>0){

    src <- file.path(
      getSrcDirectory(sys.call(sys.nframe()-1)),
      getSrcFilename(sys.call(sys.nframe()-1))
    )

    src <- gsub('^\\.',getwd(),src)
  }

  if(nchar(adc$path)>0)
    src <- path.expand(adc$path)

  if(!path_expand)
    src <- gsub(getwd(),'.',src)

  cat(c('sourced from:',src,sep='\n'))

  refloc <- crumb()

  if(!is.null(refloc))
    cat(c('referenced at: ', refloc,sep='\n'))

}
