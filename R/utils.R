path_reduce <- function(src){
  src <- gsub(normalizePath(getwd()),'.',src)
  gsub(dirname(normalizePath(tempdir())),'.',src)
}
