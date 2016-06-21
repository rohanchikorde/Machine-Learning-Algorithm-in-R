## Hierarchical clustering


library(cluster)

## we use aggne in the packge cluster 
## the default is average
## argument metric = "euclidean" indicates that we use euclidean distance
## 

food = read.csv("protein.csv")

## Euclidean distance and average linkage

foodagg = agnes(food, diss = F, metric = "euclidian") ## even you can use manhattan for calculating distance - no change
plot(foodagg) ## dendogram

## Euclidean distance and single linkage
foodagg = agnes(food, diss = F, metric = "euclidian")
plot(foodagg) ## dendogram

