
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CalcRelAb

<!-- badges: start -->
<!-- badges: end -->

The goal of CalcRelAb is to easily manipulate phyloseq objects for
graphing useful information in R. This relies heavily on the
functionality and data in the [phyloseq package by
joey711](https://joey711.github.io/phyloseq/).

While the phyloseq datatype is full of information, it does not parse
naturally into ggplot, nor does it contain / allow for calculation of
relative abundance values. This package contains the function
calc_relative_abundance() which first uses the phyloseq function
psmelt() to convert a phyloseq object into a simple R tibble. It then
appends a column onto the tibble containing the relative abundance of
each OTU for its sample.

This output can then be used for simple visualisation in base R or
ggplot, or saved to simple data formats such as .csv.

The package also contains data from the phyloseq package, saved and
documented in the /data directory.

## Installation

You can install the development version of CalcRelAb like so:

``` r
install_github("stat545ubc-2024/CalcRelAb", ref = "0.1.2")
```

This package relies on phyloseq, available from the developers on
BiocManager. The phyloseq package will be automatically installed if
missing, or you can install it yourself:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("phyloseq")
```

## Example

This is a basic example. We are using the esophagus phyloseq object that
comes with the phyloseq package, and is contained within our data. This
is passed through our calc_relative_abundance() function.

We can see that a tibble is output, with a new column that has been
created called “Relative_Abundance”.

``` r
library(CalcRelAb)
library(phyloseq)
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
#> ✔ purrr     1.0.2     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

data("esophagus")
calc_relative_abundance(esophagus)
#> # A tibble: 174 × 4
#>    OTU     Sample Abundance Relative_Abundance
#>    <chr>   <chr>      <dbl>              <dbl>
#>  1 59_2_6  D            124             0.566 
#>  2 59_2_6  B             52             0.256 
#>  3 59_8_22 B             50             0.246 
#>  4 59_5_19 C             42             0.165 
#>  5 59_7_6  C             41             0.161 
#>  6 59_2_6  C             41             0.161 
#>  7 59_7_6  B             37             0.182 
#>  8 59_8_22 C             19             0.0745
#>  9 59_7_6  D             18             0.0822
#> 10 59_5_19 B             14             0.0690
#> # ℹ 164 more rows
```
