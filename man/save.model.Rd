\name{save.model}
\alias{save.model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
saves a maximum entropy model to a file.
}
\description{
Saves a multinomial logistic regression model of class \code{\link{maxent-class}} to a specified \code{file}. This model can then be loaded using function \code{\link{load.model}}.
}
\usage{
save.model(model,file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
An object of class \code{\link{maxent-class}}, as returned by the \code{\link{maxent}} function.
}
  \item{file}{
The path to a file used to save the model.
}
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

# TRAIN USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:1000,],as.factor(data$Topic.Code)[1:1000])
save.model(model,"myModel")

# TRAIN USING REGULAR MATRIX REPRESENTATION
model <- maxent(as.matrix(matrix)[1:1000,],as.factor(data$Topic.Code)[1:1000])
save.model(model,"myModel")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}