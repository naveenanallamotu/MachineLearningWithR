#data preprocessing
#importing the data set
dataset = read.csv("Data.csv")
#taking care missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset[["Salary"]] = ifelse(is.na(dataset[["Salary"]]),
                  ave(dataset[["Salary"]], FUN = function(x) mean(x, na.rm = TRUE)),
                    dataset[["Salary"]])
dataset

#encoding the catergorical data we are factor

dataset$Country <- factor(dataset$Country ,
                          levels = c('France','Spain','Germany'), 
                          labels = c(1,2,3))
dataset
dataset$Purchased <- factor(dataset$Purchased,
                            levels =c('Yes','No'),labels =c (1,0))


#split the data into 
install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased,SplitRatio = 0.8)
traning.set <- subset(dataset, split==TRUE)
test.set <- subset(dataset, split==FALSE)
#feature scaling
traning.set[,2:3] <- scale(traning.set[,2:3])
test.set[,2:3] <- scale(test.set[,2:3])