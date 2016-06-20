USArrests

plot(USArrests)

?USArrests

summary(USArrests)

require(graphics)

pairs(USArrests, panel = panel.smooth, main = "USArrests data")

##### Generating principal components for the datasets ##########


pr.out = prcomp(USArrests, scale. = TRUE)

pr.out

names(pr.out)

pr.out$center

pr.out$sdev

pr.out$rotation

pr.out$scale

pr.out$x


states=row.names(USArrests)

states

names(USArrests)

apply(USArrests, 2, mean)

apply(USArrests, 2, var)

pr.out = prcomp(USArrests, scale. = TRUE)

pr.out

dim(pr.out$x)

biplot(pr.out, scale = 0)

pr.out$rotation =-pr.out$rotation

pr.out$x=-pr.out$x

biplot(pr.out, scale = 0)

pr.out$sdev

pr.var=pr.out$sdev ^2

pr.var

pve= pr.var/sum(pr.var)

pve

plot(pve, xlab = "Principal Component", ylab="Prportion of Variation Explained", ylim= c(0,1), type="b")

plot(cumsum(pve), xlab = "Principal Component", ylab="Cumulative proportion of Variation Explained", ylim= c(0,1), type="b")






