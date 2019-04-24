#' @title cat function for whereami
#' @description cat function for whereami output
#' @param where whereami output
#' @param type `cli` `cat_*` method. Can be `boxx`, `bullet`, `line`, `print`, `rule`.
#'     Default is `rule`.
#' @param color `cli` `col_*` method.
#' @param ... further arguments passed to `cli::cat_*`.
#' @return character
#' @examples
#'  cat_where(whereami())
#'  cat_where(whereami(), type = "bullet", bullet = "tick")
#'  cat_where(whereami(), color = "green")
#' @rdname cat_where
#' @author Colin Fay
#' @family print
#' @export
#' @importFrom cli cat_rule
#' @importFrom utils getFromNamespace
cat_where <- function(
  where,
  type= c("rule", "boxx", "bullet", "line", "print"),
  color = c("none", "black", "blue", "cyan", "green", "magenta", "red", "white", "yellow", "grey", "silver"),
  ...
){

  type <- match.arg(type)
  color <- match.arg(color)

  if(length(where)==1) {
    res <- sprintf("Running From: %s", where)
  } else {
    place <- basename(where[length(where)])
    fun <- deparse(sys.calls()[[sys.nframe() - 1]])

    this <- where[length(where)]

    if(this%in%names(wenv$counter)){
      res <- sprintf("Running %s at %s (%s)",fun,place,wenv$counter[[this]])
    }else{
      res <- sprintf("Running %s at %s",fun,place)
    }
  }

  cat_method <- getFromNamespace(
    sprintf("cat_%s", type),
    "cli"
  )

  if (color != "none"){
    col_method <- getFromNamespace(
      sprintf("col_%s", color),
      "cli"
    )
    res <- col_method(res)
  }

  cat_method(res, ...)

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

