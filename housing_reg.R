#Housing prices prediction algorithm
#Using Regression analysis in R
hsing <-read.csv("housing.csv",stringsAsFactors=FALSE)
summary(hsing)
dS = hsing[-1]
dS = dS[-1]
dS = dS[-8]
#normalize <- function(x){
 # return ((x-mean(x))/(max(x)-min(x)))
#}
summary(dS)
#dS_n = as.data.frame(lapply(dS[1:7],normalize))
#Let's not split the data into training and testing sets
housing_model1 <- lm(median_house_value ~ housing_median_age+total_rooms+
                       total_bedrooms+population+households+median_income,
                     data = dS)
summary(housing_model1)


