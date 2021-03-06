\name{getPeakData}
\alias{getPeakData}
\title{Function to return data from the NWISWeb peak values service}
\usage{
  getPeakData(sites)
}
\arguments{
  \item{sites}{string containing the site for the
  retrieval}
}
\value{
  Peak a data frame containing columns 'Date' and
  'Discharge'
}
\description{
  This function accepts a sites parameter that contains the
  desired NWIS site. It returns a data frame containing
  "Date" and "Discharge"
}
\examples{
sites<-"02178400"
getPeakData(sites)
}

