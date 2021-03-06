% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ftp.R
\name{gds_ftp}
\alias{gds_ftp}
\alias{gse_ftp}
\alias{gpl_ftp}
\title{ftp path to the directory of GEO accession (GDS, GSE or GPL)}
\usage{
gds_ftp(accession)

gse_ftp(accession)

gpl_ftp(accession)
}
\arguments{
\item{accession}{character. like 'GDS479', 'GSE3', 'GPL2570'}
}
\value{
character. ftp path to directory,  without trailing \code{/}.
}
\description{
ftp path to the directory of GEO accession (GDS, GSE or GPL)
}
\examples{
gds_ftp('GDS479')

gse_ftp('GSE3')

gpl_ftp('GPL2570')

}
