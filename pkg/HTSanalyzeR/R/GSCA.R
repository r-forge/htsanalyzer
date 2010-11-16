###############################################################################
# TODO: 
# Xin Wang <xw264@cam.ac.uk>
# Advisor: Florian Markowetz <florian.markowetz@cancer.org.uk> 
# University of Cambridge Deparment of Oncology
# Cancer Research UK - Cambridge Research Institute
# At 11:10:36, on 16 Nov 2010
###############################################################################
setClass(
		"GSCA",
		representation(
				ListOfGeneSetCollections="list",
				GeneList="list",
				hits="character",
				para="list",
				result="list"
		)
)
#Gene set enrichment analyses
setGeneric("analyze",function(object,verbose,...) standardGeneric("analyze"))
setMethod(
		"analyze",
		"GSCA",
		function(object, verbose, ...) {
			object@result<-
					analyzeGeneSetCollections(
					ListOfGeneSetCollections=object@ListOfGeneSetCollections,
					GeneList=object@GeneList,
					hits=object@hits,
					pAdjustMethod=object@para$pAdjustMethod,
					p.value.cutoff=object@para$p.value.cutoff,
					npermutations=object@para$npermutations, 
					min.gene.set.size=object@para$min.gene.set.size,
					exponent=object@para$exponent,
					verbose=verbose
			)
			object
		}
)
setMethod(
		"print",
		"GSCA",
		function(object, ...) {
			
		}
)



















