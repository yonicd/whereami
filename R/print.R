#' @title cat function for whereami
#' @description cat function for whereami output
#' @param where whereami output
#' @return character
#' @rdname cat_where
#' @export
#' @importFrom cli cat_rule
#' @importFrom digest digest
cat_where <- function(where){
  if(length(where)==1)
    return(where)

  place <- basename(where[length(where)])
  fun <- deparse(sys.calls()[[sys.nframe() - 1]])

  this <- digest::digest(as.character(where))

  if(this%in%names(wenv$counter)){
    cli::cat_rule(sprintf("Running %s at %s (%s)",fun,place,wenv$counter[[this]]))
  }else{
    cli::cat_rule(sprintf("Running %s at %s",fun,place))
  }



}


#' @export
#' @importFrom digest digest
print.whereami <- function(x,...){
  if(length(x)==1)
    return(cli::cat_rule(sprintf("Running From: %s",x)))

  place <- basename(x[length(x)])
  fun   <- deparse(sys.calls()[[sys.nframe() - 1]])

  this <- digest::digest(as.character(x))

  if(this%in%names(wenv$counter)){
    cli::cat_rule(sprintf("Running %s at %s (%s)",fun,place,wenv$counter[[this]]))
  }else{
    cli::cat_rule(sprintf("Running %s at %s",paste0(fun,collapse = ', '),place))
  }

}

