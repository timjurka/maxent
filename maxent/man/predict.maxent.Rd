\name{predict.maxent}
\alias{predict.maxent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
predicts the expected label of a document given a trained model.
}
\description{
Predicts the expected labels and probability scores of a \code{matrix} of documents given a trained model of class \code{\link{maxent-class}} generated by function \code{\link{maxent}}.
}
\usage{
\method{predict}{maxent}(object, feature_matrix, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
An object of class \code{\link{maxent-class}}, as returned by the \code{\link{maxent}} function.
}
  \item{feature_matrix}{
Either a regular \code{matrix} of class \code{DocumentTermMatrix} or \code{TermDocumentMatrix} from package \pkg{tm}, a \code{matrix.csr} representation generated by \code{\link{as.compressed.matrix}}, Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix.
}
  \item{\dots}{
Not used but needed for compatibility with generic \code{predict} method.
}
}
\value{
Returns a \code{matrix} with the first column containing predicted \code{labels}, and the remaining columns containing probability scores for each unique label.
}
\references{
Y. Tsuruoka. "A simple C++ library for maximum entropy classification." University of Tokyo Department of Computer Science (Tsujii Laboratory), 2011. URL \url{http://www-tsujii.is.s.u-tokyo.ac.jp/~tsuruoka/maxent/}.
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

# TRAIN/PREDICT USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:1000,],as.factor(data$Topic.Code)[1:1000])
results <- predict(model,sparse[1001:1500,])
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}