sms_raw <- read.csv("txtSpam.csv",stringsAsFactors = FALSE)
str(sms_raw)
#Processing labels of the data as ham/spam
sms_raw$type <- factor(sms_raw$type)
str(sms_raw$type)
table(sms_raw$type)
library(tm)
sms_corpus <- Corpus(VectorSource(sms_raw$text))
print(sms_corpus)
inspect(sms_corpus[1:3])
corpus_clean <- tm_map(sms_corpus,tolower)
corpus_clean <- tm_map(corpus_clean,removeNumbers)
corpus_clean <- tm_map(corpus_clean,removeWords,stopwords())
corpus_clean <- tm_map(corpus_clean,removePunctuation)
corpus_clean <- tm_map(corpus_clean,stripWhitespace)
inspect(corpus_clean[1:3])
sms_dtm <- DocumentTermMatrix(corpus_clean)
sms_raw_train <- sms_raw[1:4169,]
sms_raw_test <- sms_raw[4170:5571,]
sms_dtm_train <- sms_dtm[1:4169,]
sms_dtm_test <- sms_dtm[4170:5571,]
sms_corpus_train <- corpus_clean[1:4169]
sms_corpus_test <- corpus_clean[4170:5571]
prop.table(table(sms_raw_train$type))
prop.table(table(sms_raw_test$type))


