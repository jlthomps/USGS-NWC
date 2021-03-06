#' Function to return the MA2 hydrologic indicator statistic for a given data frame
#' 
#' This function accepts a data frame that contains a column named "discharge" and 
#' calculates the median of the daily flow values for the entire record
#' 
#' @param x data frame containing a "discharge" column containing daily flow values
#' @return ma2 numeric value of the median daily flow for the given data frame
#' @export
#' @examples
#' load_data<-paste(system.file(package="HITHATStats"),"/data/obs_data.csv",sep="")
#' x<-read.csv(load_data)
#' ma2(x)
ma2 <- function(x) {
  ma2 <- median(x$discharge,na.rm=TRUE)
  return(ma2)
}