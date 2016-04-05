\name{as.compressed.matrix}
\alias{as.compressed.matrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
converts a tm DocumentTermMatrix or TermDocumentMatrix into a matrix.csr representation.
}
\description{
Converts a  DocumentTermMatrix or TermDocumentMatrix (package tm), Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix into a \code{matrix.csr} representation to be used in the \code{\link{maxent}} and \code{\link{predict.maxent}} functions.
}
\usage{
as.compressed.matrix(DocumentTermMatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DocumentTermMatrix}{
A class of type DocumentTermMatrix or TermDocumentMatrix (package tm), Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix.
}
}

\value{
A \code{matrix.csr} representation of the DocumentTermMatrix or TermDocumentMatrix (package tm), Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix.
}

\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}

\examples{
# LOAD LIBRARY
\donttest{
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title))
matrix <- DocumentTermMatrix(corpus)

# CREATE A MATRIX.CSR (SPARSEM) REPRESENTATION
sparse <- as.compressed.matrix(matrix)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}