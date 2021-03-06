% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-gse.R
\name{read_gse_soft}
\alias{read_gse_soft}
\title{read GSE SOFT file (contains platform annotation)}
\usage{
read_gse_soft(soft_file, verbose = F)
}
\arguments{
\item{path}{string. path to the SOFT file}
}
\value{
tibble or NULL. the first variable is \code{ID_REF} (probe ID) and the second one is \href{https://www.genenames.org/}{HUGO} gene symbol
}
\description{
read GSE SOFT file (contains platform annotation)
}
\details{
for now, we drop probes which haven't been mapped to a symbool (mapping multiple symbols is okay)
}
\examples{
read_gse_soft(system.file('extdata/GSE19161_family.soft.gz', package = 'rGEO'))

read_gse_soft(system.file('extdata/GSE51280_family.soft.gz', package = 'rGEO'), verbose = T)

}
\seealso{
Other read raw data: 
\code{\link{parse_gse_soft}()},
\code{\link{read_gse_matrix}()}
}
\concept{read raw data}
