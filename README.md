
<!-- README.md is generated from README.Rmd. Please edit that file -->
testextra <img src="man/figures/logo.png" align="right" height=140/>
====================================================================

[![Travis build status](https://travis-ci.org/RDocTaskForce/testextra.svg?branch=master)](https://travis-ci.org/RDocTaskForce/testextra) [![Coverage](https://codecov.io/github/RDocTaskForce/testextra/coverage.svg?branch=master)](https://codecov.io/github/RDocTaskForce/testextra?branch=master) [![CRAN status](https://www.r-pkg.org/badges/version/testextra)](https://cran.r-project.org/package=testextra) [![life-cycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The goal of testextra is to facilitate extraction of tests embedded in source code.

Installation
------------

You will be able to install the released version of testextra from [CRAN](https://CRAN.R-project.org) once it is released with:

``` r
install.packages("testextra")
```

Until then or if you wish to get the latest version prior to release you may install directly from GitHub with:

``` r
remotes::install_github("RDocTaskForce/testextra")
```

Including Tests in Source Code.
-------------------------------

To include tests in source code put your tests following the function definition nested in an `if(FALSE){...}` block and tag it with a `#@testing` block tag.

``` r
#' Hello World Example
hello_world <- function(){
    message("hello world!")
}
if(FALSE){#@testing
    expect_message(hello_world(), "hello world!")
}
```

Assuming the preceding code is in a package file `./R/hello_world.R` running the `extract_tests()` command will create a file `./tests/testthat/test-hello_world.R` with the contents as below.

``` r
#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `hello_world.R`')
#line 5 "./R/hello_world.R"
test_that('hello_world', {#@testing
    expect_message(hello_world(), "hello world!")
})
```

When run, if there are error messages, the line given will be the line and file from the original source code.

Combination Functions
---------------------

The functions `test()` and `test_file()` provided in `testextra` will both extract tests from source files, run said tests, and output the results. `test()` operates on a package as a whole or a subset of a package by
setting the filter argument, see the help file for details. `test_file()` is intended to work with the [RStudio](http://rstudio.com) GUI. It takes the currently selected file, extracts tests and runs the tests. This way a tests may be run only for the current file being evaluated.

Both `test()` and `test_file()` are available through the add-ins, and made accessible through the menu of RStudio.

Other Helpers
-------------

The 'testextra\` package provides a number of useful testing functions to use when testing code.

### Inheritance

-   **`all_inherit()`** - tests if all elements of a list are of the given class or classes.
-   **`are()`** - similar to `all_inherit()`, however uses the `is()` mechanism which is more appropriate for S4 classes.
-   **`is_exactly()`** - Tests if an object is a class, but disallows inheritance.
-   **`all_are_exactly()`** - The `is_exactly()` test mapped over a list of objects.

### Strings

-   **`is_nonempty_string()`** - similar to `asssertthat::is.string()` but also ensures that the provided string is not missing (`NA`) and not empty (`""`)
-   **`is_optional_string()`** - same as `is_nonempty_string()` except does allow a character vector of length 0.

### Validity

-   **`is_valid()`** - Performs `validObject()` in a manner that is compatible with
    `validate_that()`, `assert_that()`, or `see_if()` from the `assertthat` package.
-   **`are_valid()`** - `is_valid()` over a list, which when used with the functions listed above gives the indices of objects that are not valid.
-   **`expect_valid()`** - Check validity which is to be used with the `testthat` framework.

### Namespaces

When testing dynamic class creation and modification, it is often necessary to have a package environment other that the package environment in which the creation functions are defined. For this purpose, `testextra` provides these namespace manipulation functions.

-   **`new_namespace_env()`** - Create a namespace environment. \*Similar functionality exists in `pkgload`, but is not exposed and registers the namespace by default, which `new_namespace_env()` does not.
-   **`new_pkg_environment()`** - Create a package environment. Technically a namespace does not have to be a package environment, however that is essentially always the case. This function does allow for registration of the environment as a namespace but does not do so by default.
-   **`register_namespace`** - Explicitly register a previously created namespace.
-   **`is_namespace_registered`** - Check if a namespace is registered.

### Others

A few other helpers that do not fit into one of the above categories.

-   **`catch_condition()`** - Evaluates code and captures any signals that may be raised. Useful for capturing and subsequently running multiple tests on the error captured, as an alternative to `expect_error()`, `expect_warning()`, and `expect_message()` from the `testthat` package.
-   **`class0`** - retrieve the class of an object as a single string. Separates elements by a '/' if there are more than one. *Same functionality as the `knitr::klass()` function.*
-   **`is_valid_regex`** - Check if a regular expression is valid, not that it does what is intended just that it is valid.

Documentation
-------------

The `testextra` package is developed by the R Documentation Task Force, an [R Consortium](https://www.r-consortium.org) [Infrastructure Steering Committee working group](https://www.r-consortium.org/projects/isc-working-groups).
