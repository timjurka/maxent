\name{load.model}
\alias{load.model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
loads a maximum entropy model from a file.
}
\description{
Loads a multinomial logistic regression model of class \code{\link{maxent-class}} given a \code{file} created by function \code{\link{save.model}}.
}
\usage{
load.model(file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{
The path to a file created by function \code{\link{save.model}}.
}
}
\value{
Returns an object of class \code{\link{maxent-class}} with two slots.

\item{model}{A \code{character vector} containing the trained maximum entropy model.}
\item{weights}{A \code{data.frame} listing all the weights in three columns: \code{Weight}, \code{Label}, and \code{Feature}.} 
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
saved_model <- load.model("myModel")
results <- predict(saved_model,sparse[1001:1500,])
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}