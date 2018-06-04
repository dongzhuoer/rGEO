
# matrix --------------------

#' @title read GSE series matrix file (contains expression data)
#'
#' @details for now, we don't collect sample meta data
#'
#' @param path string. path to file
#'
#' @return tibble. the first variable must be `ID_REF`, others are gene expression value of each sample
#'
#' @examples
#'
#' @seealso [write_txt]
#' @export
read_gse_matrix <- function(matrix_file, verbose = F) {
	if (!file.exists(matrix_file)) return(NULL)
	matrix_raw <- readr::read_lines(matrix_file);

    matrix_boundary <- stringr::str_which(matrix_raw, 'series_matrix_table');
	if (diff(matrix_boundary) == 2L) return(NULL); # only a header line, no data to read
    matrix <- matrix_raw[seq(matrix_boundary[1] + 1, matrix_boundary[2] - 1)] %>%
    	libzhuoer::read_char_tsv() %>% {suppressWarnings(dplyr::mutate_at(., -1, as.double))}

	# meta <- series %>% stringr::str_subset('^!Sample_') %>% stringr::str_replace('^!', '') %>%
	# 	stringr::str_split('\t') %>% plyr::laply(as.character) %>% t %>%
	# 	plyr::aaply(1, . %>% paste0(collapse = '\t')) %>% {suppressWarnings(read_char_tsv(.))}

    if (verbose) {cat('\n\nmatrix:\n'); print(matrix);};

    return(matrix)
}




# soft --------------------

#' @title read GSE soft file (contains platform annotation)
#'
#' @details for now, we drop probes which haven't been mapped to a symbool (mapping multiple symbols is okay)
#'
#' @param path string. path to file
#'
#' @return list
#'
#' 1. accession: string. platform accession
#'
#' 1. info: tibble. chip column name information
#'
#' 1. table: tibble. chip annotation
#'
#' @examples
#'
#' @seealso [read_gse_soft]
# parse_gse_soft('inst/extdata/GSE19161_family.soft.gz')
# soft_file <- 'inst/extdata/GSE12080_family.soft.gz';verbose = T
parse_gse_soft <- function(soft_file, verbose = T) {
	soft <- readr::read_lines(soft_file);
    accession <- stringr::str_subset(soft, '^\\^PLATFORM') %>% stringr::str_extract('GPL\\d+');
    table_boundary <- stringr::str_which(soft, 'platform_table');

    platform_begin <- stringr::str_which(soft, '^\\^PLATFORM'); # platform section begin
    info <- soft[platform_begin:table_boundary[1]] %>% stringr::str_subset('^#') %>% {
    	if (verbose) {cat('\nplatform meta:\n'); print(.)}
    	tibble::tibble(
			name = stringr::str_extract(., '(?<=^#)[^=]+(?= =)'),
			description = stringr::str_remove(., '^#[^=]+= +')
		)
    };

	duplicated_name <- info$name %>% {.[duplicated(.)]} %>% unique;
	if (length(duplicated_name) > 0) {
        if (accession %in% dup_use_latter) {
		    col_drop <- sapply(duplicated_name, . %>% {which(info$name == .)[1]})
        } else
			col_drop <- info$name %>% duplicated() %>% which
    	col_types <- rep('c', nrow(info)) %T>% {.[col_drop] = '-'} %>% paste0(collapse = '')
    	info %<>% dplyr::slice(-col_drop)
    } else
    	col_types <- readr::cols(.default = readr::col_character())

    table <- soft[seq(table_boundary[1] + 1, table_boundary[2] - 1)] %>% paste0(collapse = '\n') %>%
    	{suppressWarnings(readr::read_tsv(., T, col_types))} %>% libzhuoer::rm_problematic_row()
    aberrant_row <- table[[1]] %>% stringr::str_length() %>% {. > mean(.) * 10} %>% which
    if (length(aberrant_row) > 0L) table %<>% dplyr::slice(-aberrant_row);

	if (length(duplicated_name) > 0)
    	for (i in info$name %in% duplicated_name %>% which) colnames(table)[i] %<>% stringr::str_remove('_\\d$')
    if (!identical(colnames(table), info$name)) stop('parsing platform info failed')

    platform <- list(accession = accession, info = info, table = table);
    if (verbose) {cat('\n\n\nplatform:\n\n'); print(platform)}

    return(platform)
}



#' @title read GSE soft file (contains platform annotation)
#'
#' @details for now, we drop probes which haven't been mapped to a symbool (mapping multiple symbols is okay)
#'
#' @param path string. path to file
#'
#' @return tibble. the first variable is probe id and the second one is hugo gene symbol
#'
#' @examples
#'
#' @seealso [write_chip], [parse_gse_soft]
#' @export

# soft_file <- 'inst/extdata/GSE19161_family.soft.gz'
read_gse_soft <- function(soft_file, verbose = F) {
	if (!file.exists(soft_file)) return(NULL);
	platform <- parse_gse_soft(soft_file, verbose);

	platform_type <- guess_platform_type(platform);
	if (is.null(platform_type)) return(NULL);

	id <- names(platform$table)[1];
	measure = platform_type$measure;
	sep_pattern = platform_type$sep_pattern;
	as_symbol = make_as_symbol(platform_type$as_symbol_from)
	if (verbose) cat('\n', platform$accession, ': use "', platform_type$measure, '" as ', platform_type$as_symbol_from, sep = '')

	chip <- platform$table %>%
        hgnc::melt_map(id, measure, sep_pattern) %>%
        dplyr::mutate('symbol' = as_symbol(!!rlang::sym(measure))) %>%
        hgnc::cast_map(id, 'symbol') %>%
		dplyr::rename('ID_REF' = !!rlang::sym(id))

	if (verbose) {cat('\n\nchip:\n'); print(chip)}
	return(chip)
}



