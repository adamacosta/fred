#' Money
#'
#' The US money supply M1 and M2 measures in millions of USD.
#'
#' @source \url{http://www.federalreserve.gov/datadownload/Choose.aspx?rel=H6}
#' @format Data frame with columns
#' \describe{
#' \item{period}{Date Weekly}
#' \item{m1}{numeric Total M1 supply}
#' \item{currency}{numeric Currency in circulation}
#' \item{demand}{numeric Demand deposits}
#' \item{other}{numeric Other short-term deposits}
#' \item{travelers}{numeric Traveler's cheques}
#' \item{nonM1M2}{numeric M2 measures not included in M1}
#' }
#' @examples
#'   data(money)
#'
"money"
