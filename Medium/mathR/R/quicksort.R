#' Quick Sort
#'
#' Sort a numeric vector in non-decreasing order
#'
#' @param arr a numeric vector to be sorted
#'
#' @examples
#' #quicksort(c(9, 7, 1, 3, 6, -5))
#' #quicksort(c(9.8, 3, 4.0, 4.0, 9.8, -2.3))
#'
#' @export
#' @useDynLib mathR

quicksort <- function(arr) {
  stopifnot(is.numeric(arr))
  n <- length(arr)
  att_list <- .C("qsort", arr = as.double(arr),
                          f = as.integer(0),
                          l = as.integer(n-1),
                          PACKAGE = "mathR")
  return(att_list$arr)
}
