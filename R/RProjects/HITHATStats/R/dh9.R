#' Function to return the DH9 hydrologic indicator statistic for a given data frame
#' 
#' This function accepts a data frame that contains a column named "discharge" and 
#' calculates the variability of the annual maximum 30-day moving average flow for the entire record
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @return dh9 numeric containing the variability of the annual maximum 30-day moving average flow for the given data frame
#' @export
#' @examples
#' load_data<-paste(system.file(package="HITHATStats"),"/data/obs_data.csv",sep="")
#' qfiletempf<-read.csv(load_data)
#' dh9(qfiletempf)
dh9 <- function(qfiletempf) {
  meandh9 <- dh4(qfiletempf, pref = "mean")
  day30mean <- rollmean(qfiletempf$discharge, 30, align = "right", 
                        na.pad = TRUE)
  day30rollingavg <- data.frame(qfiletempf, day30mean)
  rollingavgs30day <- subset(day30rollingavg, day30rollingavg$day30mean != 
                               "NA")
  max30daybyyear <- aggregate(rollingavgs30day$day30mean, 
                              list(rollingavgs30day$wy_val), max, na.rm=TRUE)
  sddh9 <- sd(max30daybyyear$x)
  dh9 <- (sddh9 * 100)/meandh9
  return(dh9)
}