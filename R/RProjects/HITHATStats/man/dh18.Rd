\name{dh18}
\alias{dh18}
\title{Function to return the DH18 hydrologic indicator statistic for a given data frame}
\usage{
  dh18(qfiletempf)
}
\arguments{
  \item{qfiletempf}{data frame containing a "discharge"
  column containing daily flow values}
}
\value{
  dh18 numeric containing the mean duration of high pulse
  flow for the given data frame
}
\description{
  This function accepts a data frame that contains a column
  named "discharge" and calculates the mean average pulse
  duration for each year of flow above 3*median flow for
  the entire record
}
\examples{
load_data<-paste(system.file(package="HITHATStats"),"/data/obs_data.csv",sep="")
qfiletempf<-read.csv(load_data)
dh18(qfiletempf)
}

