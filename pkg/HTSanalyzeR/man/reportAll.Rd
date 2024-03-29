\name{reportAll}
\alias{reportAll}
\alias{reportAll,GSCA_Or_NULL,NWA_Or_NULL-method}
\title{
Write html reports for both the enrichment and network analyses
}
\description{
This is a generic function.

When implemented as the method of class \code{\link[HTSanalyzeR:GSCA]{GSCA}} and \code{\link[HTSanalyzeR:NWA]{NWA}}, 
this function produces a report for both the results of Gene Set Collection
Analysis and the Network Analysis. 

To use \code{reportAll} for objects of class \code{\link[HTSanalyzeR:GSCA]{GSCA}} and \code{\link[HTSanalyzeR:NWA]{NWA}}:

reportAll(gsca, nwa, experimentName="Unknown", species=NULL, ntop=NULL,
allSig=FALSE, keggGSCs=NULL, goGSCs=NULL, reportDir="HTSanalyzerReport")
}
\usage{
reportAll(gsca, nwa, ...)
}
\arguments{
  \item{gsca}{
an object of class \code{\link[HTSanalyzeR:GSCA]{GSCA}} (see help(GSCA))
}
  \item{nwa}{
an object of class \code{\link[HTSanalyzeR:NWA]{NWA}} (see help(NWA))
}
  \item{...}{
other arguments. (see below for the arguments supported by the method of
class \code{\link[HTSanalyzeR:NWA]{NWA}} and \code{\link[HTSanalyzeR:GSCA]{GSCA}})
}
\describe{
  \item{experimentName:}{
a single character value specifying the name of the experiment (just
for you own record)
} 
  \item{species:}{
a single character value specifying the species for which the data should
be read. Current version support one of the following species: "Dm"
("Drosophila_melanogaster"), "Hs" ("Homo_sapiens"), "Rn" ("Rattus_
norvegicus"), "Mm" ("Mus_musculus"), "Ce" ("Caenorhabditis_elegans").
}
  \item{ntop:}{
a single integer value specifying the number of plots to be produced for
the GSEA analysis.  For each gene set collection, plots are produced for
the top 'ntop' most significant p-values.  
}
  \item{allSig:}{
a single logical value determining whether or not to generate plots for
all significant gene sets. A gene set is significant if its corresponding
adjusted p-value is less than the \code{pValueCutoff} set in function
\code{analyze}. (see function \code{analyze} for more details)   
 }
  \item{keggGSCs:}{
a character vector of names of all KEGG gene set collections. This will
help create web links for KEGG terms. 
}
  \item{goGSCs:}{
a character vector of names of all GO gene set collections. This will
help create web links for GO terms. 
}
  \item{reportDir:}{
a single character value specifying the directory to store reports
}
}

}
\details{
This function takes in the objects of the two wrapper classes (\code{GSCA}
and \code{NWA}) and writes a report into the user-specified directory.
An index html file containing a summary of all results and hyperlinked tabs
to more detailed results will be generated in the root directory. The other
html files will be stored in a subdirectory called 'html'. All images
including GSEA plots and subnetwork figure will be produced in a sub-
directory called 'image'. All documents or text files such as the files
containing significant gene sets of the hypergeometric test results will
be stored in a subdirectory called 'doc'. 
}
\author{
Xin Wang, Camille Terfve
}
\seealso{
\code{\link[HTSanalyzeR:report]{report}}, \code{\link[HTSanalyzeR:writeReportHTSA]{writeReportHTSA}}
}
\examples{
\dontrun{
##(see the vignette for details about the preprocessing of this data set)
data("KcViab_GSCA")
data("KcViab_NWA")	
##report both analyses
reportAll(gsca=KcViab_GSCA, nwa=KcViab_NWA, experimentName="KcViab",
species="Dm", allSig=TRUE, keggGSCs="PW_KEGG", goGSCs=c("GO_BP","GO_MF",
"GO_CC"), reportDir="HTSanalyzerReport")
browseURL(file.path(getwd(), "HTSanalyzerReport", "index.html"))
}
}
