crumb <- function() {
  x <- .traceback(1)

  if (any(grepl("^rmarkdown", x[[length(x)]]))) {
    srloc <- gsub('^(.*?)\\(|\\,(.*?)$|["]', "", x[[length(x)]][1])

    return(srloc)
  }

  idx <- which(sapply(x, function(xx) all(grepl(pattern = "whereami", xx))))

  idx <- idx[length(idx)]

  srcloc <- if (!is.null(srcref <- attr(x[[idx]], "srcref"))) {
    srcfile <- attr(srcref, "srcfile")
    srcfile_name <- srcfile$filename

    if (!nzchar(srcfile_name)) {
      return(NULL)
    }

    sprintf("%s#%s", srcfile_name, srcref[1L])
  } else {
    NULL
  }

  return(srcloc)
}
