library(ISLR)
NCI60
nci.data = NCI60$data
nci.labs = NCI60$labs
sd.data = scale(nci.data)
par(mfrow = c(1,3))
data.dist = dist(sd.data)

plot(hclust(data.dist, method = "average"), labels = nci.labs, main = "Average Linkage", xlab = "", sub = "", ylab = "")
plot(hclust(data.dist, method = "single"), labels = nci.labs, main = "Single Linkage", xlab = "", sub = "", ylab = "")
plot(hclust(data.dist, method = "complete"), labels = nci.labs, main = "Complete Linkage", xlab = "", sub = "", ylab = "")
