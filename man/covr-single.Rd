% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coverage.R
\name{covr-single}
\alias{covr-single}
\alias{file_coverage}
\alias{covr_file}
\title{Single File Coverage}
\usage{
file_coverage(file = rstudioapi::getSourceEditorContext()$path,
  pkg = ".", ...)

covr_file(coverage = file_coverage(), report.file = NULL,
  show.report = interactive())
}
\arguments{
\item{file}{The file to extract test from and compute coverage.}

\item{pkg}{The package \code{file} is associated with.}

\item{...}{Arguments passed on to \code{covr::file_coverage}
\describe{
  \item{source_files}{Character vector of source files with function
definitions to measure coverage}
  \item{test_files}{Character vector of test files with code to test the
functions}
  \item{line_exclusions}{a named list of files with the lines to exclude from
each file.}
  \item{function_exclusions}{a vector of regular expressions matching function
names to exclude. Example \code{print\\\\.} to match print methods.}
  \item{parent_env}{The parent environment to use when sourcing the files.}
}}

\item{coverage}{Coverage returned from \code{file_coverage()}.}

\item{report.file}{Where to save the HTML report.}

\item{show.report}{if the HTML report should be displayed.}
}
\description{
These functions extract tests, run tests and create a report of the coverage for
a single file.
}
\section{Functions}{
\itemize{
\item \code{file_coverage}: Extract tests and compute the coverage for the given file.

\item \code{covr_file}: Create a report for a single
}}

