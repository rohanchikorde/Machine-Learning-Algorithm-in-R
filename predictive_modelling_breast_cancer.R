## Building a predictive modelling on breast cancer data


getwd()

cancerdata <- read.csv("breast-cancer-wisconsin.csv", stringsAsFactors = F)

## examine the structure of data 
str(cancerdata)

## to get the column names of the data
names(cancerdata)

## there are many issues in the data
## 1) ID_number is not important for analysis
## 2) bare.nuclei is character
## 3) Class - benign and malignant repsresenting 2 and 4 is not user friendly
## we need to solve these issues before building the model

## 1) we can remove ID column by setting it to null

cancerdata$ID.number <- NULL

## 2) converting bare nuclei to numeric
## any value that cannot be converted to numeric is set as NA

cancerdata$Bare.Nuclei <- is.numeric(cancerdata$Bare.Nuclei)

## we can then use complete.cases function to identify the rows without missing data.
cancerdata = cancerdata[complete.cases(cancerdata),]

str(cancerdata)

## finally the data cleanup stage

cancerdata$Class <- factor(ifelse(cancerdata$Class ==2, "benign", "malignant" ))

str(cancerdata)


## building the model

training_set = cancerdata[1:477, 1:9]
test_set = cancerdata[488:699,1:9]

## similarly we split the diagnosis (benign, malignant) into training and test outcome set

train_outcome = cancerdata[1:477,10]
test_outcome = cancerdata[488:699,10]

## now we are ready to create a model   

install.packages("class")
library(class)
predictions = knn(train = training_set, cl = train_outcome, k=21, test = test_set)

predictions


## evaluating the power of predictive model

table(newcase_output, predictions)


