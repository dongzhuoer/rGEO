# rGEO
[![Build Status](https://travis-ci.com/dongzhuoer/rGEO.svg?branch=master)](https://travis-ci.com/dongzhuoer/rGEO)

## Overview

utilities for accessing GEO (Gene Expression Omnibus)


## develop

1. clone or download
1. toggle roxygen2 in `Build & Reload` (`.Rproj.user/********/build_options`)

## to do

multiple platform

https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE4198
ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4198/matrix/GSE4198-GPL178_series_matrix.txt.gz

gse_soft

```r
soft_url <- . %>% geo_url('soft', '_family.soft');
matrix_url <- . %>% geo_url('matrix', '_series_matrix.txt');
soft_url('GSE69708')
matrix_url('GSE69708')
```



## url
> GEO file url

ftp://ftp.ncbi.nlm.nih.gov/geo/datasets/GDS3nnn/GDS3882/
