\name{NYTimes}
\alias{NYTimes}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
a sample dataset containing labeled headlines from The New York Times.
}
\description{
A sample dataset containing labeled headlines from The New York Times, compiled by Professor Amber E. Boydstun at the University of California, Davis.
}
\usage{
data(NYTimes)
}
\format{
A \code{data.frame} containing five columns.

1. \code{Article_ID} - A unique identifier for the headline from The New York Times.

2. \code{Date} - The date the headline appeared in The New York Times.

3. \code{Title} - The headline as it appeared in The New York Times.

4. \code{Subject} - A manually classified subject of the headline.

5. \code{Topic.Code} - A manually labeled topic code corresponding to the subject.
}
\source{
http://www.amberboydstun.com/
}
\examples{
# READ THE CSV
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
# ALTERNATIVELY, USE THE data() FUNCTION
data(NYTimes)
}
\keyword{datasets}

