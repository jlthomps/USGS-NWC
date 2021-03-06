#' Function to return the DH1 hydrologic indicator statistic for a given data frame
#' 
#' This function accepts a data frame that contains a column named "discharge" and 
#' calculates the mean of the annual maximum daily flow for the entire record
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @param pref string containing a "mean" or "median" preference
#' @return dh1 numeric containing the mean of the annual maximum daily flow for the given data frame
#' @export
#' @examples
#' load_data<-paste(system.file(package="HITHATStats"),"/data/obs_data.csv",sep="")
#' qfiletempf<-read.csv(load_data)
#' dh1(qfiletempf)
dh1 <- function(qfiletempf, pref = "mean") {
  annualmax <- aggregate(qfiletempf$discharge, list(qfiletempf$wy_val), max)
  if (pref == "median") {
    dh1 <- median(annualmax$x)
  }
  else {
    dh1 <- mean(annualmax$x)
  }
  return(dh1)
}