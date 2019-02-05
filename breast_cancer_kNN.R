#load the dataset in R
wbcd = read.csv("wbdc_data.csv",stringsAsFactors=FALSE)
wbcd = wbcd[-1]
table(wbcd$diagnosis)
wbcd$diagnosis = factor(wbcd$diagnosis,levels=c("B","M"),
                        labels = c("Benign","Malignant"))
round(prop.table(table(wbcd$diagnosis))*100,digits=1)
#Look at some example data
summary(wbcd[c("radius_m","smoothness_m","area_m")])
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
#Each of the features can be normalized but another process can be 
#used to automate the process
wbcd_n <- as.data.frame(lapply(wbcd[2:31],normalize))
summary(wbcd_n$area_m)
wbcd_tr <- wbcd_n[1:469,]
wbcd_ts <- wbcd_n[470:569,]
wbcd_tr_labels <- wbcd[1:469,1]
wbcd_ts_labels <- wbcd[470:569,1]
library(class)
#Use the kNN classifier in the class library to classify the data
wbcd_pred <- knn(train=wbcd_tr,test=wbcd_ts,cl=wbcd_tr_labels,k=21)
library(gmodels)
CrossTable(x=wbcd_ts_labels,y=wbcd_pred,
           prop.chisq=FALSE)

