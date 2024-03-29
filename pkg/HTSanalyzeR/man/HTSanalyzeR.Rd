\name{HTSanalyzeR-package}
\alias{HTSanalyzeR}
\alias{HTSanalyzeR-package}
\docType{package}
\title{
HTSanalyzeR Package Overview
}

\description{
This package does enrichment (hypergeometric tests and GSEA) and network
analyses (based on the package 'BioNet') for high-throughput screens. 
}

\details{
	\tabular{ll}{
Package: \tab HTSAnalyzeR\cr
Type: \tab Package\cr
Version: \tab 2.1.0\cr
Date: \tab 2010-12-05\cr
License: \tab Artistic-2.0\cr
LazyLoad: \tab yes\cr
	}
	
The most important classes in this package are 'GSCA' (Gene Set Collection
Analyses) and 'NWA' (NetWork Analyses). As an example, a pipeline (see
function 'HTSanalyzeR4cellHTS2') is developed in this package for cellHTS2
screen analyses. Based on these two classes and other functions, users can 
design their own pipelines specifically for their own data sets.   

Full help on classes and associated functions is available from within
class help pages.

Introductory information on the use of classes and pipeline are available
in the vignette, type\code{openVignette()}.

A full listing of documented topics is available in HTML view by typing
\code{help.start()} and selecting the \code{HTSanalyzeR} package from the
\code{Packages} menu or via \code{library(help="HTSanalyzeR")}.
}

\author{
Xin Wang, Camille D.A. Terfve, John C. Rose, and Florian Markowetz
Maintainer: Xin Wang <Xin.Wang@cancer.org.uk>
}

\references{
Subramanian, A., Tamayo, P., Mootha, V. K., Mukherjee, S., Ebert, B. L.,
Gillette, M. A., Paulovich, A., Pomeroy, S. L., Golub, T. R., Lander,
E. S. & Mesirov, J. P. (2005) \emph{ Gene set enrichment analysis: A
knowledge-based approach for interpreting genome-wide expression profiles.}
Proc. Natl. Acad. Sci. USA 102, 15545-15550.

Beisser D, Klau GW, Dandekar T, Muller T, Dittrich MT. BioNet: an R-Package
for the functional analysis of biological networks. Bioinformatics. 2010
Apr 15;26(8):1129-30.

Dittrich MT, Klau GW, Rosenwald A., Dandekar T and Muller T. \emph{Identifying
functional modules in protein-protein interaction networks: an integrated
exact approach.} Bioinformatics 2008 24(13):i223-i231.
}

\keyword{package}
