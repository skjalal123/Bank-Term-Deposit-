setwd("C:/Users/wasim/Download")
library("dplyr")
library("sqldf")
library("rpivotTable")
library("party")
library("plotly")
data<-read.csv("bank-additional-full.csv",header = T,sep = ";")
data$y<-(data$y=="yes")*1
str(data)
summary(data)
temp<-sqldf("select count(y) as cnt,pdays
            from data
            group by pdays order by pdays")
View(temp)
rpivotTable(data,rows = "educations",cols = "y",aggregatorName = "count",vals = "mpg")

sum(is.na(data$nr.employed))
sapply(data,function(x) sum(is.na(x)))


data$Age_bin<-cut(data$age,breaks = c(15,25,35,45,55,65,100),include.lowest = T)
sort(unique(data$Age_bin))
Age.freq<-table(data$Age_bin)
Age.freq
