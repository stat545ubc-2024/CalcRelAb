test_that("Testing variable class specificity", {
  expect_error(calc_relative_abunance(2:10))
  expect_error(calc_relative_abunance("This is a character!"))
  expect_error(calc_relative_abunance(data_frame("Num"=1:5,"Let"=c("a","b","c","d","e"))))
})


test_that("Testing output accuracy", {
  library(phyloseq)
  library(dplyr)
  otu_matrix <- matrix(c(10, 1, 0, 2, 10, 22), nrow=3, byrow=TRUE)
  rownames(otu_matrix) <- c("OTU1", "OTU2", "OTU3")
  colnames(otu_matrix) <- c("Sample1", "Sample2")
  otu_table <- otu_table(otu_matrix, taxa_are_rows=TRUE)

  # Create sample data (sample metadata, ie. samples and treatments)
  sample_data_frame <- data.frame(SampleID = c("Sample1", "Sample2"),
                                  Condition = c("Control", "Treated"))
  rownames(sample_data_frame) <- sample_data_frame$SampleID
  sample_data <- sample_data(sample_data_frame)

  # Create taxonomy table (matrix of taxonomic classification)
  taxonomy_matrix <- matrix(c("Bacteria", "Firmicutes", "Clostridia",
                              "Bacteria", "Proteobacteria", "Gammaproteobacteria",
                              "Bacteria", "Actinobacteria", "Actinobacteria"),
                            nrow=3, byrow=TRUE)
  rownames(taxonomy_matrix) <- c("OTU1", "OTU2", "OTU3")
  colnames(taxonomy_matrix) <- c("Domain", "Phylum", "Class")
  tax_table <- tax_table(taxonomy_matrix)

  # Combine all components into a phyloseq object
  sample_physeq <- phyloseq(otu_table, sample_data, tax_table)
  expected_rel_abundance <- c(0.88,0.5,0.5,0.08,0.04,0)
  expected_abundance <- c(22,10,10,2,1,0)
  expected_OTU <- c("OTU3","OTU1","OTU3","OTU2","OTU1","OTU2")
  expect_equal(calc_relative_abunance(sample_physeq)$Relative_Abundance,
               expected_rel_abundance)
  expect_equal(calc_relative_abunance(sample_physeq)$Abundance,
               expected_abundance)
  expect_equal(calc_relative_abunance(sample_physeq)$OTU,
               expected_OTU)
  rm(list=c("otu_matrix","otu_table","sample_data_frame","sample_data","taxonomy_matrix","tax_table",
       "sample_physeq","expected_OTU","expected_abundance","expected_rel_abundance"))
})
