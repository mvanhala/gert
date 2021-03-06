% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pr.R
\name{git_checkout_pull_request}
\alias{git_checkout_pull_request}
\title{GitHub Wrappers}
\usage{
git_checkout_pull_request(pr = 1, remote = "origin", repo = ".")
}
\arguments{
\item{pr}{number with PR to check out}

\item{remote}{name of a remote listed in \code{\link[=git_remote_list]{git_remote_list()}}}

\item{repo}{a path to an existing repository, or a \code{git_repository} object as
returned by \link{git_open},  \link{git_init} or \link{git_clone}.}
}
\description{
Some wrappers for working with Github.
}
