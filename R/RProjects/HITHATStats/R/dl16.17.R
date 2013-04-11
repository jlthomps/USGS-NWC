#' Function to return the DL16 and DL17 hydrologic indicator statistics for a given data frame
#' 
#' This function accepts a data frame that contains a column named "discharge" and 
#' calculates the variability and median average pulse duration for each year of flow below the 25th percentile for the entire record
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @return dl16.17 list containing the median duration of low pulse flow and variability for the given data frame
#' @export
#' @examples
#' load_data<-paste(system.file(package="HITHATStats"),"/data/obs_data.csv",sep="")
#' qfiletempf<-read.csv(load_data)
#' dl16.17(qfiletempf)
dl16.17 <- function(qfiletempf) {
  isolateq <- qfiletempf$discharge
  sortq <- sort(isolateq)
  frank <- floor(findrank(length(sortq), 0.75))
  lfcrit <- sortq[frank]
  subset_crit <- subset(qfiletempf, qfiletempf$discharge<lfcrit)
  yrs_dur <- data.frame(year_val = rep(0,nrow(subset_crit)), cnt = rep(9,nrow(subset_crit)), set = rep(0,nrow(subset_crit)))
  yrs_dur$cnt[1] <- 0
  yrs_dur$year_val[1] <- subset_crit$year_val[1]
  yrs_dur$set[1] <- 0
  i <- 1
  counter <- 0
  set_cnt <- 1
  sub_length <- nrow(subset_crit)-1
  for (i in 1:sub_length) {
    yrs_dur$year_val[i+1] <- subset_crit$year_val[i+1]
    if (subset_crit$jul_val[i+1] - subset_crit$jul_val[i] == 1) { 
      yrs_dur$cnt[i+1]<-1+counter
      counter <- counter+1
    }
    else {
      yrs_dur$cnt[i+1]<-0
      counter <- 0
      yrs_dur$set[i+1]<-set_cnt
      set_cnt <- set_cnt+1
    }
  }
  sets_cnt <- max(yrs_dur$set)
  sets_yr <- data.frame(year_val = rep(0,sets_cnt), num_days = rep(0,sets_cnt), set_num = rep(0,sets_cnt))
  for (j in 1:sets_cnt) {
    num <- match(j,yrs_dur$set) 
    sets_yr$year_val[j] <- yrs_dur$year_val[num-1]
    sets_yr$num_days[j] <- yrs_dur$cnt[num-1]+1
    sets_yr$set_num[j] <- yrs_dur$set[num]
  }
  meanbyyr <- aggregate(sets_yr$num_days, list(sets_yr$year_val), 
                       FUN = mean, na.rm=TRUE)
  colnames(meanbyyr) <- c("Year", "num_mean")
  dl16 <- median(meanbyyr$num_mean)
  dl17 <- sd(meanbyyr$num_mean)/dl16
  dl16.17 <- list(dl16=dl16,dl17=dl17)
  return(dl16.17)
}