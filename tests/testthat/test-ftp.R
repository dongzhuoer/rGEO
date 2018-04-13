testthat::context('Testing foobar')
if (basename(getwd()) == 'testthat') setwd('../..')

testthat::test_that('gpl_ftp_soft()', {
    testthat::expect_identical(gpl_ftp_soft('GPL6947'), 'ftp://ftp.ncbi.nlm.nih.gov/geo/platforms/GPL6nnn/GPL6947/soft/GPL6947_family.soft.gz');
});


