.onLoad <- function(libname, pkgname) {
  if (!requireNamespace("phyloseq", quietly = TRUE)) {
    message("Installing 'phyloseq' from Bioconductor...")
    if (!requireNamespace("BiocManager", quietly = TRUE)) {
      install.packages("BiocManager")
    }
    BiocManager::install("phyloseq")
  }
}
