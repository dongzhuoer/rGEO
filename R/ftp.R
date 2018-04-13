#' @title ftp directory for GDS accession
#'
#' @param accession character.
#'
#' @return character. path to the ftp directory, without trailing `/`
#'
#' @examples
#' \donotrun{
#'     gds_ftp('GDS479') %>% browseURL()
#' }
#'
#' @export
gds_ftp <- function(accession) {
	geo_ftp(accession, 'datasets');
}

#' @title ftp directory for GSE accession
#' @examples
#' \donotrun{
#'     gse_ftp('GSE3') %>% browseURL()
#' }
#'
#' @export
gse_ftp <- function(accession) {
	geo_ftp(accession, 'series');
}

#' @title ftp directory for GPL accession
#' @examples
#' \donotrun{
#'     gpl_ftp('GPL2570') %>% browseURL()
#' }
#'
#' @export
gpl_ftp <- function(accession) {
	geo_ftp(accession, 'platforms');
}

#' @title ftp for GDS accession's soft file
#' @examples
#' gpl_ftp_soft('GPL6947')
#'
#' @export
gpl_ftp_soft <- function(accession) {
	paste0(gpl_ftp(accession), '/soft/', accession, '_family.soft.gz')
}

#' @export
geo_ftp <- function(accession, base_dir) {
	accession %>% {paste0(stringr::str_replace(., '\\d{1,3}$', 'nnn/'), .)} %>%
		paste('ftp://ftp.ncbi.nlm.nih.gov/geo', base_dir, ., sep = '/');
}


#' @export
gse_ftp_soft <- function(accession) {
	paste0(gse_ftp(accession), '/soft/', accession, '_family.soft.gz')
}


#' @export
gse_ftp_matrix <- function(accession) {
	paste0(gse_ftp(accession), '/matrix/', accession, '_series_matrix.txt.gz')
}

