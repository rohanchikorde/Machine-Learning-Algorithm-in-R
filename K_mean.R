## K means Algo

food <- read.csv("protein.csv")
food

set.seed(1)

grpproteins = kmeans(food[,-1], centers = 3)


## list of cluster assignments

o = order(grpproteins$cluster)
data.frame(food$Country[o], grpproteins$cluster[o])
