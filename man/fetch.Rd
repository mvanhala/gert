% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch.R
\name{fetch}
\alias{fetch}
\alias{git_fetch}
\alias{git_push}
\alias{git_clone}
\alias{git_pull}
\title{Push and Pull}
\usage{
git_fetch(remote = NULL, refspec = NULL, password = askpass,
  ssh_key = NULL, verbose = interactive(), repo = ".")

git_push(remote = NULL, refspec = NULL, password = askpass,
  ssh_key = NULL, mirror = FALSE, force = FALSE,
  verbose = interactive(), repo = ".")

git_clone(url, path = NULL, branch = NULL, password = askpass,
  ssh_key = NULL, bare = FALSE, mirror = FALSE,
  verbose = interactive())

git_pull(..., repo = ".")
}
\arguments{
\item{remote}{name of a remote listed in \code{\link[=git_remote_list]{git_remote_list()}}}

\item{refspec}{string with mapping between remote and local refs}

\item{password}{a string or a callback function to get passwords for authentication
or password protected ssh keys. Defaults to \link[askpass:askpass]{askpass} which
checks \code{getOption('askpass')}.}

\item{ssh_key}{path or object containing your ssh private key. By default we
look for keys in \code{ssh-agent} and \link[credentials:ssh_key_info]{credentials::ssh_key_info}.}

\item{verbose}{display some progress info while downloading}

\item{repo}{a path to an existing repository, or a \code{git_repository} object as
returned by \link{git_open},  \link{git_init} or \link{git_clone}.}

\item{mirror}{use the \code{--mirror} flag}

\item{force}{use the \code{--force} flag}

\item{url}{remote url. Typically starts with \code{https://github.com/} for public
repositories, and \code{https://yourname@github.com/} or \code{git@github.com/} for
private repos. You will be prompted for a password or pat when needed.}

\item{path}{directory of the git repository. For \code{git_init} or \code{git_clone}
this must be a non-existing or empty directory.}

\item{branch}{name of branch to check out locally}

\item{bare}{use the \code{--bare} flag}

\item{...}{arguments passed to \link{git_fetch}}
}
\description{
Use \link{git_fetch} and \link{git_push} to sync a local branch with a remote.
Here \link{git_pull} is a wrapper for \link{git_fetch} which that tries to
\link[=git_branch_fast_forward]{fast-forward} the local branch after fetching.
}
\examples{
{# Clone a small repository
git_dir <- file.path(tempdir(), 'antiword')
git_clone('https://github.com/ropensci/antiword', git_dir)

# Change into the repo directory
olddir <- getwd()
setwd(git_dir)

# Show some stuff
git_log()
git_branch_list()
git_remote_list()

# Add a file
write.csv(iris, 'iris.csv')
git_add('iris.csv')

# Commit the change
jerry <- git_signature("Jerry", "jerry@hotmail.com")
git_commit('added the iris file', author = jerry)

# Now in the log:
git_log()

# Cleanup
setwd(olddir)
unlink(git_dir, recursive = TRUE)
}
}
\seealso{
Other git: \code{\link{branch}}, \code{\link{commit}},
  \code{\link{git_config}}, \code{\link{repository}},
  \code{\link{signature}}
}
\concept{git}
