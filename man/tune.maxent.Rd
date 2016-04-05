\name{tune.maxent}
\alias{tune.maxent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
fits a maximum entropy model given a training matrix and a vector or factor of labels.
}
\description{
Fits a multinomial logistic regression model of class \code{\link{maxent-class}} given a \code{matrix} or \code{matrix.csr} with training data, and a \code{vector} or \code{factor} with corresponding labels.
}
\usage{
tune.maxent(feature_matrix, code_vector, nfold=3, showall=FALSE, verbose=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{feature_matrix}{
A DocumentTermMatrix or TermDocumentMatrix (package tm), Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix.
}
  \item{code_vector}{
A \code{factor} or \code{vector} of labels corresponding to each document in the \code{feature_matrix}.
}
  \item{nfold}{
An \code{integer} specifying the number of folds to perform for cross-validation. Defaults to \code{3}.
}
  \item{showall}{
A \code{logical} specifying whether to show the accuracy results of all tested parameter configurations. Defaults to \code{FALSE}.
}
  \item{verbose}{
A \code{logical} specifying whether to provide descriptive output about the fitting process. Defaults to \code{FALSE}, or no output.
}
}

\value{
Returns an object of class \code{matrix} with configurations along the y-axis and parameters along the x-axis.
}
\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\examples{
# LOAD LIBRARY
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
\donttest{
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title))
matrix <- DocumentTermMatrix(corpus)

# TRAIN USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- tune.maxent(sparse[1:1000,],as.factor(data$Topic.Code)[1:1000])


# A DIFFERENT EXAMPLE
data(iris)
attach(iris)

x <- subset(iris, select = -Species)
y <- Species

f <- tune.maxent(x,y,nfold=3,showall=TRUE)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}