#' Relative abundances in phyloseq object
#'
#' @description
#' Starting from a phyloseq object, this applies the psmelt function to convert data into an R dataframe and subsequently calculate relative abundance of each taxonomic unit within its sample.
#'
#' @param ps a whole phyloseq object of taxonomic produced by the phyloseq::phyloseq() function.
#'        ps is named thus as this is common shorthand for a phyloseq object in the field.
#' @return an R data frame of microbiome composition data containing sample ID and all other
#' provided metadata, taxonomic information, abundance values, and relative abundance values.
#' Abundance values of NA are dropped.
#' @examples
#' data(esophagus, package = "phyloseq")
#' data(GlobalPatterns, package = "phyloseq")
#' data(soilrep, package = "phyloseq")
#' calc_relative_abundance(esophagus)
#' calc_relative_abundance(GlobalPatterns)
#' calc_relative_abundance(soilrep)
#' @export
calc_relative_abundance <- function(ps) {
  #confirm data in put is of the phyloseq object class, rather than an unusable form
  if(class(ps)!="phyloseq") {
    stop("Input is not a phyloseq object, but rather " , class(ps))}

  #convert phyloseq object to an R dataframe
  data <- ps |>
    phyloseq::psmelt()

  #confirm that psmelt created the expected columns, required for our processing
  if (!"Sample" %in% colnames(data)) {
    stop("The 'Sample' column is missing from the data.")}
  if (!"Abundance" %in% colnames(data)) {
    stop("The 'Abundance' column is missing from the data.")}

  #remove NA values, then group by sample to calculate the relative abundance of each taxon within a sample
  data <- data |>
    dplyr::filter(!is.na(Abundance)) |>
    dplyr::group_by(Sample) |>
    dplyr::mutate(Relative_Abundance = Abundance / sum(Abundance)) |>
    dplyr::ungroup()

  return(data)
}
