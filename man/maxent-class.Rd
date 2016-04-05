\name{maxent-class}
\docType{class}
\alias{maxent-class}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
an S4 class containing the trained maximum entropy model.
}
\description{
An \code{S4 class} containing the trained maximum entropy model and its corresponding weights as a \code{data.frame} with three columns: \code{Weight}, \code{Label}, and \code{Feature}.
}
\section{Objects from the Class}{
  Objects could in principle be created by calls of the 
  form \code{new("maxent", ...)}.
  The preferred form is to have them created via a call to 
  \code{\link{maxent}}.
}
\section{Slots}{
  \describe{
    \item{\code{model}}{Object of class \code{"character"}:
      stores the trained maximum entropy model as returned from \code{\link{maxent}}}
    \item{\code{weights}}{Object of class \code{"data.frame"}:
      contains the weights of the trained maximum entropy model, with three columns: \code{Weight}, \code{Label}, and \code{Feature}.}
  }
}
\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\examples{
\donttest{
# LOAD LIBRARY
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title))
matrix <- DocumentTermMatrix(corpus)

# TRAIN USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:1000,],as.factor(data$Topic.Code)[1:1000])
class(model)
model@model
model@weights
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{classes}