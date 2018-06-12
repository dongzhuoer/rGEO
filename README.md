# rGEO
[![Build Status](https://travis-ci.com/dongzhuoer/rGEO.svg?branch=master)](https://travis-ci.com/dongzhuoer/rGEO)



## Overview

This package contains functions to read GSE raw data and returns a tidy format. 
    It's especially useful for chip annotation file, the format of which is 
    really in a messy. You just need to provide the raw data file and it will 
    give you a nice table containing probes and 
    [HUGO](https://www.genenames.org/) gene symbols.



## Installation

```r
if (!('devtools' %in% .packages(T))) install.packages('devtools');
devtools::install_github('dongzhuoer/rGEO');
```



## Usage

Inpatient people please refer to this [quick start](https://dongzhuoer.github.io/rGEO/articles/rGEO.html#quick-start).

For why this package, read this [article](https://dongzhuoer.github.io/rGEO/articles/probe2symbol.html).


## external data

https://www.ncbi.nlm.nih.gov/geo/browse/, search for `GSE***`, download file from the `Download family` section at the bottom



## Developing

```r
if (!('devtools' %in% .packages(T))) install.packages('devtools');
devtools::install_github('dongzhuoer/rGEO.data');
```


1. Refer to this [post](https://dongzhuoer.github.io/_redirects/develop-upon-my-r-package.html)




## to do

1. trunc GSE23041 soft for 3+ duplicated column name
1. support GSE with multiple series: the soft file maybe contain more than one platform.
   https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE4198
   ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4198/matrix/GSE4198-GPL178_series_matrix.txt.gz
1. extract sample meta data from series file
1. add more test for `read_gse_soft()`
1. [1] "GSE69813" "GSE82007"
   no platform_table

