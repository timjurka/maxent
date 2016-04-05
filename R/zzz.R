.onLoad <- function(libname, pkgname) {
  assign("maximumentropy",
         Module("maximumentropy", PACKAGE = "maxent"),
         envir = .BaseNamespaceEnv)
  setClass("maxent", representation(model = "character",
                                    weights = "data.frame"))
}

.onAttach <- function(libname, pkgname) {
  # just to show a startup message
  message <- paste(pkgname, utils::packageVersion(pkgname), "loaded.")
  packageStartupMessage(message, appendLF = TRUE)
}
