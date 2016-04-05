\name{maxent-package}
\alias{maxent-package}
\docType{package}
\title{
Low-memory Multinomial Logistic Regression with Support for Text Classification
}
\description{
\pkg{maxent} is an R package with tools for low-memory multinomial logistic regression, also known as maximum entropy. The focus of this maximum entropy classifier is to minimize memory consumption on very large datasets, particularly sparse document-term matrices represented by the \pkg{tm} package. The library is built on top of an efficient C++ implementation written by Yoshimasa Tsuruoka.
}
\details{
\tabular{ll}{
Package: \tab maxent\cr
Type: \tab Package\cr
Version: \tab 1.3.1\cr
Date: \tab 2011-12-21\cr
License: \tab GPL-3\cr
LazyLoad: \tab yes\cr
}
}
\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\references{
Y. Tsuruoka. "A simple C++ library for maximum entropy classification." University of Tokyo Department of Computer Science (Tsujii Laboratory), 2011. URL \url{http://www-tsujii.is.s.u-tokyo.ac.jp/~tsuruoka/maxent/}.
}
\keyword{package}

\examples{
# LOAD LIBRARY
\donttest{
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title))
matrix <- DocumentTermMatrix(corpus)

# TRAIN/PREDICT USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:1000,],data$Topic.Code[1:1000])
results <- predict(model,sparse[1001:1500,])
}
}
