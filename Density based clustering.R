iris

## Density based clustering ##########


library(dbscan)

## Retaining only first 4 columns

iris <- as.matrix(iris[,1:4])

res <- dbscan(iris, eps = .6, minPts = 4)

res

res$cluster

################################# DBScan algorithm on protein data #########################


protein

View(protein)

protein <- as.matrix(protein[,-1])

protein

res <- dbscan(protein, eps = 9 , minPts = 3)

res

res$cluster


####################################################### k-means algo on protein data ########################

###################################################### Hierarchical clustering on protein data ##################







