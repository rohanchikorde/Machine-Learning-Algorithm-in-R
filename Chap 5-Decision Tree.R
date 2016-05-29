## Decision tree algorithm:

## credit data set

## reading the file

credit <- read.csv("credit.csv")

str(credit)
summary(credit)

table(credit$checking_balance)

## dividing the data into training set and testing set

set.seed(123)
train_sample = sample(1000,900) ## select 900 random values from 1 to 1000

str(train_sample)

credit_train = credit[train_sample,]
credit_test = credit[-train_sample,]

nrow(credit_test)

## about 30% of defaulted loan in each data set

prop.table(table(credit_train$default))

prop.table(table(credit_test$default))

## for decision tree, we will use "C50" package

install.packages("C50")
library(C50)

## now building model 

## 17th column in the dataset in the class variable so need to exclude from the training
## data frame but supply it as target factor 

colnames(credit_train)

## converting type of default column from integer to factor
credit_train$default = as.factor(credit_train$default)

credit_model = C5.0(credit_train[-17], credit_train$default)


credit_model

summary(credit_model)

## prediction 

credit_pred = predict(credit_model, credit_test)
credit_pred

## evaluation using table

library(gmodels)
CrossTable(credit_test$default, credit_pred, 
           prop.chisq = F, prop.c = F, prop.r = F,
           dnn = c('actual default', 'predicted default'))



## improving performance

credit_boost10 <- C5.0(credit_train[-17],credit_train$default, trails = 10)
credit_boost10

summary(credit_boost10)

credit_pred_boost = predict(credit_boost10, credit_test)
CrossTable(credit_test$default, credit_boost10, 
           prop.chisq = F, prop.c = F, prop.r = F,
           dnn = c('actual default', 'predicted default'))


length(credit_pred_boost)
length(credit_test$default)
