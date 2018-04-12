testthat::context('Testing foobar')

testthat::test_that('something', {
    testthat::expect_identical(1L, 1L);
    testthat::expect_true(T);
});


if (Sys.getenv('TRAVIS') == 'true' && Sys.getenv('CI') == 'true') {

} else {
    
}

