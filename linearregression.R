## Linear Regression
library(psych)
file2 <- read.clipboard.tab(header = TRUE)

model2 <- lm(Salary ~. , data = file2)
summary(model2)

##
predict(model2,file2[1:10,])
pred<- predict(model2,file2)
pred


## Calculating the error 
error = file2$Salary - pred
error_squared = (error)^2
MSE = mean(error^2)
MSE


##Logistic Regression
## Applied when the class is Categorical with 2 factors(Yes/no, Male/Female)

model2 = glm(Loan.approval ~., data = file2, family =binomial(link = "logit"))
summary(model2)

test <- data.frame(Salary=c(200,300,400),Age = c(50,40,30))

predict(model2,test)
predict(model2,test, type = "response")



## Logistic Regression on computer purchase data.
file1
str(file1)
library(plyr)
file1[file1$Computer.bought == "yes"] = 1
file1[file1$Computer.bought == "no"] <- 0

file1[file1$Computer.bought == "yes"] <- 1


model3 = glm(Computer.bought~.,data = file1,family = binomial(link="logit"))
summary(model3)
