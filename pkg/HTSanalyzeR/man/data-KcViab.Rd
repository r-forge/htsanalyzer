\name{data-KcViab}
\alias{KcViab_Norm}
\alias{KcViab_Data4Enrich}
\alias{KcViab_PVals}
\alias{KcViab_GSCA}
\alias{KcViab_NWA}
\alias{Biogrid_DM_Interactome}

\title{A Sample data set of the package HTSanalyzeR}

\description{
'KcViab_Norm' is a normalized cellHTS object (KcViab_Norm) 
generated from a genome-wide RNAi screen of cell viability in 
\emph{Drosophila} Kc167 cells (see help(KcViab)).

'KcViab_Data4Enrich' is a vector of phenotypes summarized 
and preprocessed from 'KcViab_Norm' (see section 4.1 of the 
vignette of package \emph{HTSanalyzeR} for details).

'KcViab_PVals' is a vector of p-values generated by statistical
tests for the summarized data of 'KcViab_Norm' (see section 5.1 
of the vignetted of package \emph{HTSanalyzeR} for details).

'KcViab_GSCA' is an object of class 'GSCA' (Gene Set Collection
Analysis) (see section 4.2 of the vignette of package \emph{HTSanalyzeR} 
for details).

'KcViab_NWA' is an object of class 'NWA' (NetWork Analysis) (see 
section 5.2 of the vignetted of package \emph{HTSanalyzeR} for 
details).

'Biogrid_DM_Interactome' is an object of class \emph{graphNEL} built from 
the interaction data set for \emph{Drosophila Melanogaster} downloaded
from \emph{Biogrid} database (version 3.1.71, accessed on Dec. 5, 2010).
}

\usage{##cellHTS object, see examples for details}

\format{\code{\linkS4class{cellHTS}} object}

\references{
Boutros, M., Kiger, A.A., Armknecht,S., Kerr,K., Hild,M., Koch,B., Haas, 
S.A., Heidelberg Fly Array Consortium, Paro,R. and Perrimon, N. (2004) 
Genome-wide RNAi analysis of growth and viability in Drosophila cells, 
\emph{Science} \bold{303}:832--5.
}

\examples{
    data("KcViab_Norm")
    data("KcViab_Data4Enrich")
    data("KcViab_PVals")
    data("KcViab_GSCA")
    data("KcViab_NWA")
    data("Biogrid_DM_Interactome")
}
\keyword{datasets}
