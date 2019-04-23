#' @title cat function for whereami
#' @description cat function for whereami output
#' @param where whereami output
#' @return character
#' @examples
#'  cat_where(whereami())
#' @rdname cat_where
#' @family print
#' @export
#' @importFrom cli cat_rule
cat_where <- function(where){
  if(length(where)==1)
    return(where)

  place <- basename(where[length(where)])
  fun <- deparse(sys.calls()[[sys.nframe() - 1]])

  this <- where[length(where)]

  if(this%in%names(wenv$counter)){
    cli::cat_rule(sprintf("Running %s at %s (%s)",fun,place,wenv$counter[[this]]))
  }else{
    cli::cat_rule(sprintf("Running %s at %s",fun,place))
  }



}


#' @export
print.whereami <- function(x,...){
  if(length(x)==1)
    return(cli::cat_rule(sprintf("Running From: %s",x)))

  place <- basename(x[length(x)])
  fun   <- deparse(sys.calls()[[sys.nframe() - 1]])

  this <- x[length(x)]

  if(this%in%names(wenv$counter)){
    cli::cat_rule(sprintf("Running %s at %s (%s)",fun,place,wenv$counter[[this]]))
  }else{
    cli::cat_rule(sprintf("Running %s at %s",paste0(fun,collapse = ', '),place))
  }

}

