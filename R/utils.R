path_reduce <- function(src){
  src <- gsub(normalizePath(getwd()),'.',src)
  src <- gsub(normalizePath(tempdir()),'.',src)
  gsub(dirname(normalizePath(tempdir())),'.',src)
}
