#Text messaging filtering and classification
sms_raw <- read.csv("textData.csv",stringsAsFactors=FALSE)
str(sms_raw)
library(tm)
str(sms_raw$type)
table(sms_raw$type)
sms_corpus <- Corpus(VectorSource(sms_raw$text))
print(sms_corpus)
inspect(sms_corpus[1:3])
corpus_clean <- tm_map(sms_corpus,tolower)
corpus_clean <- tm_map(corpus_clean, removeNumbers)
corpus_clean <- tm_map(corpus_clean,removeWords,stopwords())
corpus_clean <- tm_map(corpus_clean,removePunctuation)
corpus_clean <- tm_map(corpus_clean,stripWhitespace)
inspect(sms_corpus[1:3])
#Create a sparse matrix through tokenization
sms_dtm <- DocumentTermMatrix(corpus_clean)
#Split into training and text data
sms_raw_train <- sms_raw[1:4169,]
sms_raw_test <- sms_raw[4170:5572,]
sms_dtm_train <- sms_dtm[1:4169,]
sms_dtm_test <- sms_dtm[4170:5572,]
sms_corpus_train <- corpus_clean[1:4169]
sms_corpus_test <- corpus_clean[4170:5572]
#Confirm subsets are representative of the complete set
prop.table(table(sms_raw_train$type))
prop.table(table(sms_raw_test$type))
spam <- subset(sms_raw_train,type=="spam")
ham <- subset(sms_raw_train,type=="ham")
library(wordcloud)
wordcloud(spam$text,max.words=40,scale=c(2,0.5))
wordcloud(ham$text,max.words=40,scale=c(2,0.5))



