\name{pandoc}
\alias{pandoc}
\title{A Pandoc wrapper to convert Markdown documents to other formats}
\usage{
pandoc(input, format, config = getOption("config.pandoc"), ext = NA)
}
\arguments{
  \item{input}{a character vector of the Markdown
  filenames}

  \item{format}{the output format (see References); it can
  be a character vector of multiple formats; by default, it
  is obtained from the \code{t} field in the configuration
  (if the configuration is empty or the \code{t} field is
  not found, the default output format will be
  \code{'html'})}

  \item{config}{the Pandoc configuration file; if missing,
  it is assumed to be a file with the same base name as the
  \code{input} file and an extension \code{.pandoc} (e.g.
  for \file{foo.md} it looks for \file{foo.pandoc})}

  \item{ext}{the filename extensions; by default, the
  extension is inferred from the \code{format}, e.g.
  \code{latex} creates \code{pdf}, and \code{dzslides}
  creates \code{html}, and so on}
}
\value{
The output filename(s) (or an error if the conversion failed).
}
\description{
This function calls Pandoc to convert Markdown documents to other formats
such as HTML, LaTeX/PDF and Word, etc, (optionally) based on a configuration
file or in-file configurations which specify the options to use for Pandoc.
}
\details{
There are two ways to input the Pandoc configurations -- through a config
file, or embed the configurations in the markdown file as special comments
between \verb{<!--pandoc} and \verb{-->}.

The configuration file is a DCF file (see \code{\link{read.dcf}}). This file
must contain a field named \code{t} which means the output format. The
configurations are written in the form of \code{tag:value} and passed to
Pandoc (if no value is needed, just leave it empty, e.g. the option
\code{standalone} or \code{s} for short). If there are multiple output
formats, write each format and relevant configurations in a block, and
separate blocks with blank lines.

If there are multiple records of the \code{t} field in the configuration, the
input markdown file will be converted to all these formats by default, unless
the \code{format} argument is specified as one single format.
}
\examples{
system("pandoc -h")  # see possible output formats
}
\references{
Pandoc: \url{http://johnmacfarlane.net/pandoc/}; Examples and
  rules of the configurations: \url{http://yihui.name/knitr/demo/pandoc}
}
\seealso{
\code{\link{read.dcf}}
}
