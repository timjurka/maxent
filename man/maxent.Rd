\name{maxent}
\alias{maxent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
trains a maximum entropy model given a training matrix and a vector or factor of labels.
}
\description{
Trains a multinomial logistic regression model of class \code{\link{maxent-class}} given a \code{matrix} or \code{matrix.csr} with training data, and a \code{vector} or \code{factor} with corresponding labels. Additional parameters such as \code{feature_cutoff}, \code{gaussian_prior}, \code{inequality_constraints}, and \code{set_heldout} help prevent model overfitting.
}
\usage{
maxent(feature_matrix, code_vector, l1_regularizer=0.0, l2_regularizer=0.0,
use_sgd=FALSE, set_heldout=0, verbose=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{feature_matrix}{
A DocumentTermMatrix or TermDocumentMatrix (package tm), Matrix (package Matrix), matrix.csr (SparseM), data.frame, or matrix.
}
  \item{code_vector}{
A \code{factor} or \code{vector} of labels corresponding to each document in the \code{feature_matrix}.
}
  \item{l1_regularizer}{
An \code{numeric} turning on L1 regularization and setting the regularization parameter. A value of 0 will disable L1 regularization.
}
  \item{l2_regularizer}{
An \code{numeric} turning on L2 regularization and setting the regularization parameter. A value of 0 will disable L2 regularization.
}
  \item{use_sgd}{
A \code{logical} indicating that SGD parameter estimation should be used. Defaults to \code{FALSE}.
}
  \item{set_heldout}{
An \code{integer} specifying the number of documents to hold out. Sets a held-out subset of your data to test against and prevent overfitting.
}
  \item{verbose}{
A \code{logical} specifying whether to provide descriptive output about the training process. Defaults to \code{FALSE}, or no output.
}
}
\details{
Yoshimasa Tsuruoka recommends using one of following three methods if you see overfitting.

     1. Set the \code{l1_regularizer} parameter to \code{1.0}, leaving \code{l2_regularizer} and \code{set_heldout} as default.

     2. Set the \code{l2_regularizer} parameter to \code{1.0}, leaving \code{l1_regularizer} and \code{set_heldout} as default.

     3. Set the \code{set_heldout} parameter to hold-out a portion of your data, leaving \code{l1_regularizer} and \code{l2_regularizer} as default.

If you are using a large number of training samples, try setting the \code{use_sgd} parameter to \code{TRUE}.
}
\value{
Returns an object of class \code{\link{maxent-class}} with two slots.

\item{model}{A \code{character vector} containing the trained maximum entropy model.}
\item{weights}{A \code{data.frame} listing all the weights in three columns: \code{Weight}, \code{Label}, and \code{Feature}.}
}
\references{
Y. Tsuruoka. "A simple C++ library for maximum entropy classification." University of Tokyo Department of Computer Science (Tsujii Laboratory), 2011. URL \url{http://www-tsujii.is.s.u-tokyo.ac.jp/~tsuruoka/maxent/}.
}
\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\examples{
# LOAD LIBRARY
library(maxent)

\donttest{
# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title))
matrix <- DocumentTermMatrix(corpus)

# TRAIN USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:1000,],as.factor(data$Topic.Code)[1:1000])
}

# A DIFFERENT EXAMPLE (taken from package e10711)
# CREATE DATA
x <- seq(0.1, 5, by = 0.05)
y <- log(x) + rnorm(x, sd = 0.2)

# ESTIMATE MODEL AND PREDICT INPUT VALUES
m <- maxent(x, y)
new <- predict(m, x)

# VISUALIZE
plot(x, y)
points(x, log(x), col = 2)
points(x, new[,1], col = 4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}
