# rGEO
[![Build Status](https://travis-ci.com/dongzhuoer/rGEO.svg?branch=master)](https://travis-ci.com/dongzhuoer/rGEO)

## Overview

deal with GEO (Gene Expression Omnibus) raw data

1. utilities to access GEO data

<iframe src="URL"></iframe>

## develop

1. clone or download
1. toggle roxygen2 in `Build & Reload` (`.Rproj.user/********/build_options`)

## to do

1. trunc GSE23041 soft for 3+ duplicated column name
1. support GSE with multiple series: the soft file maybe contain more than one platform.
   https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE4198
   ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4198/matrix/GSE4198-GPL178_series_matrix.txt.gz
1. extract sample meta data from series file
1. add more test for `read_gse_soft()`
1. [1] "GSE69813" "GSE82007"
   no platform_table





```r
soft_url <- . %>% geo_url('soft', '_family.soft');
matrix_url <- . %>% geo_url('matrix', '_series_matrix.txt');
soft_url('GSE69708')
matrix_url('GSE69708')
```



## url
> GEO file url

ftp://ftp.ncbi.nlm.nih.gov/geo/datasets/GDS3nnn/GDS3882/
