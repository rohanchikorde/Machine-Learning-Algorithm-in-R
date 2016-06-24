
############### Generic algorithm for SVM #################


library(e1071)

View(iris)

names(iris)

attach(iris)

## Using entire dataset as a training dataset

## Creating subset of class variable

x <- subset(iris, select=Species)

## Assigning species to y

y <- Species

y

svm_model <- svm(x,y)

summary(svm_model)

pred <- predict(svm_model,x)

table(pred,y)


