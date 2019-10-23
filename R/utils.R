path_reduce <- function(src) {
  src <- gsub(normalizePath(getwd(),winslash = '/'), ".", src)
  src <- gsub(normalizePath(tempdir(),winslash = '/'), ".", src)
  gsub(dirname(normalizePath(tempdir(),winslash = '/')), ".", src)
}
