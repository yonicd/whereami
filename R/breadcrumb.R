crumb <- function () {

  x <- .traceback(1)

  idx <- which(sapply(x,function(xx) all(grepl(pattern = 'whereami',xx))))

  idx <- idx[length(idx)]

  srcloc <- if (!is.null(srcref <- attr(x[[idx]], "srcref"))) {
    srcfile <- attr(srcref, "srcfile")
    sprintf('%s#%s',srcfile$filename,srcref[1L])
  }else{
    NULL
  }

  return(srcloc)

}
