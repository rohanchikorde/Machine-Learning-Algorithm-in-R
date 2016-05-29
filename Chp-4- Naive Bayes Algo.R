getwd()

## Naive bayes algorithm

rm(list = ls())

# read file
sms_raw <- read.csv("sms_spam.csv", header = T, stringsAsFactors = F)

str(sms_raw)

## since it is the character vector (spam or ham) it is better to make a class as a factor
sms_raw$type <- factor(sms_raw$type)

## examine the structure and table for type colummn
str(sms_raw$type)

table(sms_raw$type)

## data cleaning and data preparation as it contain many uninterested word such and,but, or

## for data cleansing of text spam data
install.packages("tm")

## loading requires NLP package to load
library(NLP)
library(tm)


## accepting the text to spam detection
## VCorpus is the function that stores all the text data
## PCorpus is to get the access of permanently stored on harddisk
## vectorSource - to read the data from the file

sms_corpus <- VCorpus(VectorSource(sms_raw$text))

print(sms_corpus)

## to view first 2 text sms
inspect(sms_corpus[1:2])

## To view the actual msg
as.character(sms_corpus[[1]])

## Applying lapply
lapply(sms_corpus[1:2], as.character)

## to count Hello, HELLO, HELlo to be counted as one word - Data cleansing for performing analysis
## for this we use tm_map() function

## content_transformer() to treat tolower() as a
## transformation function that can be used to access the corpus

## The content_transformer() function can be used to apply more
## sophisticated text processing and cleanup processes, such as grep
## pattern matching and replacement


sms_corpus_clean <- tm_map(sms_corpus, content_transformer(tolower))
sms_corpus_clean

## checking for first text whether it has converted to lower case
as.character(sms_corpus[[1]])
as.character(sms_corpus_clean[[1]])
## now it has converted all to lower character

## lets remove numbers from msg as most of them will not provide any good insights

sms_corpus_clean <- tm_map(sms_corpus_clean, removeNumbers)

## now remove filler word such as to, and , but
## becoz they appear frequently and do not provide any useful insights
## for this we will use stopwords() function provided by tm package.

sms_corpus_clean <- tm_map(sms_corpus_clean, removeWords, stopwords())

## remove punctuation
sms_corpus_clean <- tm_map(sms_corpus_clean, removePunctuation)

## to remove suffix ---- leaning, learns, learned -- converted to learn
## for this install snowballC

install.packages("SnowballC")
library(SnowballC)

wordStem()



############### pg no. 111






