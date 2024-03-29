\name{NWA-class}
\alias{NWA}
\alias{NWA-class}
\docType{class}
\title{
A class for NetWork Analysis
}
\description{
This class includes methods to do network analysis for a vector of p-values 
computed from high-throughput screens. 
}
\section{Objects from the Class}{ 
Objects of class \code{NWA} can be created from \code{
new("NWA", pvalues, phenotypes=NULL, interactome=NULL)} (see
the examples below)
}
\section{Slots}{
	\describe{	
		\item{\code{pvalues}:}{
		a numeric vector of p-values.
		}
		
		\item{\code{phenotypes}:}{
		a numeric or integer vector of phenotypes.
		}
		
		\item{\code{interactome}:}{
		an object of class \code{graphNEL}.
		}
		
		\item{\code{fdr}:}{
		one parameter for BioNet to score nodes in the interactome.
		}
		
		\item{\code{result}:}{
		a list of subnetwork module identified by 'BioNet' and a vector of 
		labels for nodes of the subnetwork module.
		}
		
		\item{\code{summary}:}{
		a list of summary information for \code{p-values}, \code{phenotypes}, 
		\code{interactome} and \code{result}.
		}
		
		\item{\code{preprocessed}:}{
		a logical value specifying whether or not input data has been 
		preprocessed.
		}
	}
}
\section{Methods}{
	An overview of methods with class-specific functionality:
	More detailed introduction can be found in help for each specific
	function.
	\describe{	
		\item{\code{preprocess}}{ 
		do preprocessing on input gene list and hit list including: 
		a) removing NAs in \code{p-values} and \code{phenotypes}; 
		b) invoking function \code{duplicateRemover} to process
		duplicated phenotypes and p-values (see \code{duplicateRemover}
		for more details); 
		c) invoking function \code{annotationConvertor} to convert
		annotations; 
		}
		\item{\code{analyze}}{
		invoke function \code{networkAnalysis} to identify sub-networks
		based on input parameter list \code{para}.
		}
		\item{\code{summarize}}{
		print summary information of \code{p-values}, \code{phenotypes},
		\code{interactome} and \code{result}.
		}
		\item{\code{interactome}}{
		build an interactome for the network analysis.
		}
		\item{\code{viewSubNet}}{
		plot a figure to screen for identified subnetwork.
		}
		\item{\code{plotSubNet}}{
		plot and save a figure for identified subnetwork.
		}
		\item{\code{report}}{
		generate html reports.
		}
	}
}
\author{Xin Wang \email{xw264@cam.ac.uk}}
\seealso{
  \code{\link[HTSanalyzeR:preprocess]{preprocess}}
  \code{\link[HTSanalyzeR:analyze]{analyze}}
  \code{\link[HTSanalyzeR:summarize]{summarize}}
  \code{\link[HTSanalyzeR:interactome]{interactome}}
  \code{\link[HTSanalyzeR:viewSubNet]{viewSubNet}}
  \code{\link[HTSanalyzeR:plotSubNet]{plotSubNet}}
  \code{\link[HTSanalyzeR:report]{report}}
}
\examples{
\dontrun{
library(BioNet)
##load p-values and phenotypes
data("KcViab_PVals","KcViab_Data4Enrich")
##load Biogrid interactome for Drosophila Melanogaster
data("Biogrid_DM_Interactome")
##create a NWA (NetWork Analysis) object
nwa <- new("NWA", pvalues=KcViab_PVals, phenotypes=KcViab_Data4Enrich, 
interactome=Biogrid_DM_Interactome)
##preprocessing
nwa <- preprocess(nwa, species="Dm", initialIDs="Entrez.gene", 
keepMultipleMappings=TRUE, duplicateRemoverMethod="max")
##To create an interactome:
nwa <- interactome(nwa, species="Dm", reportDir="HTSanalyzerReport",
genetic=FALSE)
##do network analysis
nwa <- analyze(nwa, fdr=0.001, species="Dm")
graphics.off()
##view identified subnetwork
viewSubNet(nwa)
##report as html pages
report(object=nwa, experimentName="NWATest", species="Dm", allSig=TRUE,
keggGSCs="PW_KEGG", goGSCs=c("GO_BP", "GO_MF", "GO_CC"), reportDir=
"NWATestReport")
##browse the index page of the report
browseURL(file.path(getwd(), "NWATestReport", "index.html"))
}
}
\keyword{classes}
