
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CalcRelAb

<!-- badges: start -->
<!-- badges: end -->

The goal of CalcRelAb is to easily manipulate phyloseq objects for
graphing useful information in R. While the phyloseq datatype is full of
information, it does not parse naturally into ggplot, nor does it
contain / allow for calculation of relative abundance values. This
package contains the function calc_relative_abundance() which first uses
the phyloseq function psmelt() to convert a phyloseq object into a
simple R dataframe. It then appends a column onto the dataframe
containing the relative abundance of each OTU for its sample.

## Installation

You can install the development version of CalcRelAb like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(CalcRelAb)
library(phyloseq)
data("esophagus")
calc_relative_abunance(esophagus)
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

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
