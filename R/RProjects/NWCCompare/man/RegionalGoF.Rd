\name{RegionalGoF}
\alias{RegionalGoF}
\title{Function to calculate GoF statistics for given observed and modeled statistics}
\usage{
  RegionalGoF(GagedFlowStats, ModeledFlowStats)
}
\arguments{
  \item{GagedFlowStats}{data frame of flow stats for
  observed data}

  \item{ModeledFlowStats}{data frame of flow stats for
  modeled data}
}
\value{
  Output data frame of calculated statistics
}
\description{
  This function accepts data frames of statistics for
  observed and modeled daily flow time-series and returns a
  data frame of calculated GoF statistics
}

