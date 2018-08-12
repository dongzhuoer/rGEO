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
remotes::install_github('dongzhuoer/rGEO');
```



## Usage

Inpatient people please refer to `vignette('rGEO')`.

For why this package, read this `vignette('probe2symbol')`.
