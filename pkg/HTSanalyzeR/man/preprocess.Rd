\name{preprocess}
\alias{preprocess}
\title{
Preprocessing method for object of class 'GSCA' or 'NWA'
}
\description{
This is an S4 method, which can be applied to an object of 
either class \code{GSCA} or \code{NWA}. This function will filter out
invalid data, curate duplicated genes, convert annotations to Entrez 
identifiers, etc.
}
\usage{
For objects of class 'GSCA':

preprocess(object, species="Dm", initialIDs="FlybaseCG", keepMultipleMappings
=TRUE, duplicateRemoverMethod="max", orderAbsValue=FALSE, verbose=TRUE)

For objects of class 'NWA'

preprocess(object, species="Dm", initialIDs="FlybaseCG", keepMultipleMappings
=TRUE, duplicateRemoverMethod="max", verbose=TRUE)
}
\arguments{
	\item{object}{
an object of class 'GSCA' or 'NWA'
}
	\item{species}{
a single character value specifying the species for which the data 
should be read. The current version supports one of the following 
species: "Dm" ("Drosophila_melanogaster"), "Hs" ("Homo_sapiens"), 
"Rn" ("Rattus_norvegicus"), "Mm" ("Mus_musculus"), "Ce" 
("Caenorhabditis_elegans"). This is an optional argument here. If it is 
provided, then the labels of nodes of the identified subnetwork will be
mapped from Entrez IDs to gene symbols; otherwise, Entrez IDs will be
used as labels for those nodes.
}
  \item{initialIDs}{
a single character value specifying the type of initial identifiers for input 
'geneList'. Current version can take one of the following types: 
"Ensembl.transcript", "Ensembl.prot", "Ensembl.gene", "Entrez.gene", "RefSeq", 
"Symbol" and "GenBank" for all supported species; "Flybase", "FlybaseCG" and 
"FlybaseProt" for Drosophila Melanogaster; "wormbase" for Caenorhabditis Elegans. 
}
  \item{keepMultipleMappings}{
a single logical value. If TRUE, the function keeps the entries with multiple 
mappings (first mapping is kept). If FALSE, the entries with multiple mappings 
will be discarded.
}
	\item{duplicateRemoverMethod}{
a single character value specifying the method to remove the duplicates 
(should the minimum, maximum or average observation for a same construct be kept). 
Current version provides "min" (minimum), "max" (maximum), "average" and "fc.avg" 
(fold change average). The minimum and maximum should be understood in terms of 
absolute values (i.e. min/max effect, no matter the sign). The fold change average 
method converts the fold changes to ratios, averages them and converts the average 
back to a fold change.
}
	\item{orderAbsValue}{
a single logical value determining whether the values should be converted 
to absolute value and then ordered (if TRUE), or ordered as they are (if FALSE).	
}
	\item{verbose}{
a single logical value deciding to display detailed messages (when 
verbose=TRUE) or not (when verbose=FALSE)
}
}
\details{

This function will potentially do the following preprocessing steps:
\describe{	
	\item{1:}{ filter out pvalues (slot \code{pvalues} of class \code{NWA}), 
	phenotypes (slot \code{phenotypes} of class \code{NWA}) and data for 
	enrichment (slot \code{geneList} of class \code{GSCA}) with NA values 
	or without valid names, and invalid gene names (the \code{hits} slot of class 
	\code{GSCA});
}
	\item{2:}{ invoke function \code{duplicateRemover} to curate duplicated genes 
	in slot \code{pvalues}, \code{phenotypes} of class \code{NWA}, and slot \code{geneList} 
	and \code{hits} of class \code{GSCA};
}
	\item{3:}{ invoke function \code{annotationConvertor} to convert annotations from
	\code{initialIDs} to Entrez identifiers. Please note that slot \code{hits} and 
	names of slot \code{geneList} in class \code{GSCA}, slot \code{pvalues} and 
	\code{phenotypes} in class \code{NWA} must have the same type of annotation 
	specified by \code{initialIDs};
}	
	\item{4:}{ order the data for enrichment decreasingly for objects of 
	class \code{GSCA}. 
}
}
See function \code{duplicateRemover} for more details about how to remove duplicated 
genes.

See function \code{annotationConvertor} for more details about how to convert 
annotations.
}
\value{
In the end, this function will return an updated object of class \code{GSCA} 
or \code{NWA}.  
}
\author{
Xin Wang \email{xw264@cam.ac.uk}
}
\seealso{
\code{duplicateRemover}, \code{annotationConvertor}
}
\examples{
\dontrun{
library(org.Dm.eg.db)
library(KEGG.db)
##load data for enrichment analyses
data("data4enrich")
##select hits
hits <- names(data4enrich)[which(abs(data4enrich) > 2)]
##set up a list of gene set collections
PW.KEGG <- KeggGeneSets(species = "Dm")
gsc.list <- list(PW.KEGG = PW.KEGG)
##create an object of class 'GSCA'
gsca <- new("GSCA", listOfGeneSetCollections=gsc.list,
geneList = data4enrich, hits = hits)
##print gsca
summary(gsca, what = c("GeneList", "Hits"))
##do preprocessing (data4enrich has already been preprocessed)
gsca <- preprocess(gsca, species="Dm", initialIDs = "Entrez.gene", 
keepMultipleMappings = TRUE, duplicateRemoverMethod = "max", 
orderAbsValue = FALSE)
##print updated object
summary(gsca, what = c("GeneList", "Hits"))
}
}









