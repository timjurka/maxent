context("The main maxent function")

# Tests ==========

test_that("Should work for simple corpus", {
  ## text
  text <- c("Lorem ipsum dolor sit amet", "Lorem ipsum dolor sit amet")

  # create corpus for training
  corpus <- Corpus(
    VectorSource(text),
    readerControl = list(reader = readPlain, language = "en")
  )

  # preprocess corpus and create DTM
  matrix <- DocumentTermMatrix(corpus)

  # train a multinomial logitic model
  expect_silent(model <- maxent(feature_matrix = matrix,
                                code_vector = c("outcomeA", "outcomeB")))
})

# test_that("Issue #1: R crashes when no code_vector included", {
#
#     ## text
#   text <- c("Lorem ipsum dolor sit amet", "Lorem ipsum dolor sit amet")
#
#   # create corpus for training
#   corpus <- Corpus(
#     VectorSource(text),
#     readerControl = list(reader = readPlain, language = "en")
#   )
#
#   # preprocess corpus and create DTM
#   matrix <- DocumentTermMatrix(corpus)
#
#   # train a multinomial logitic model
#   expect_silent(model <- maxent(feature_matrix = matrix,
#                                 code_vector = c("outcomeA")))
# })
