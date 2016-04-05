\name{USCongress}
\alias{USCongress}
\docType{data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
a sample dataset containing labeled bills from the United State Congress.
}
\description{
A sample dataset containing labeled bills from the United States Congress, compiled by Professor John D. Wilkerson at the University of Washington, Seattle and E. Scott Adler at the University of Colorado, Boulder.
}
\usage{
data(USCongress)
}
\format{
A \code{data.frame} containing five columns.

1. \code{ID} - A unique identifier for the bill.

2. \code{cong} - The session of congress that the bill first appeared in.

3. \code{billnum} - The number of the bill as it appears in the congressional docket.

4. \code{h_or_sen} - A field specifying whether the bill was introduced in the House (HR) or the Senate (S).

5. \code{major} - A manually labeled topic code corresponding to the subject of the bill.
}
\source{
\url{http://www.congressionalbills.org/}
}
\examples{
# READ THE CSV
data <- read.csv(system.file("data/USCongress.csv.gz",package="maxent"))
# ALTERNATIVELY, USE THE data() FUNCTION
data(USCongress)
}
\keyword{datasets}

