install.packages("bsts", lib="C:/R/win-library/3.3")





install.packages("https://cran.r-project.org/bin/windows/contrib/3.2/bsts_0.6.2.zip", 
                 repos = NULL, type = "local")
library(devtools)
devtools::install_github("google/CausalImpact")





install.packages("devtools")
install.packages("bsts")
install.packages("BoomSpikeSlab")
install.packages("Boom")
install.packages("DBI")
library(devtools)
library(Boom)
library(xts)
library(tibble)
library(BoomSpikeSlab)
devtools::install_github("google/CausalImpact")
library(CausalImpact)


Y = read.table("Casual Impact-google.csv")
traffic = data.frame(Y)
dim(traffic)
head(traffic)
matplot(traffic, type = "l")
pre.period = c(1,31)
post.period = c(32,50)
res = CausalImpact(traffic, pre.period,post.period)
plot(res)
time.points = seq.Date(as.Date("2014-12-27"), by =1, length.out = 50)
data = zoo(cbind(Y), time.points)
head(data)
pre.period = as.Date(c("2014-12-27", "2015-01-26"))
post.period = as.Date(c("2015-01-27", "2015-02-14"))
res = CausalImpact(data, pre.period,post.period)
plot(res)
summary(res)
summary(res, "report")
res$summary


