dataset = read.csv("50_Startups.csv")
#encoding the catergorical data we are factor

dataset$State <- factor(dataset$State ,
                          levels = c('New York','California','Florida'), 
                          labels = c(1,2,3))
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit,SplitRatio = 0.8)
traning.set <- subset(dataset, split==TRUE)
test.set <- subset(dataset, split==FALSE)
# fitting to multiple regression
regressor = lm(formula = Profit ~ .,
               data = traning.set)

regressor = lm(formula = Profit ~ .,
               data = traning.set)
y.pred <- predict(regressor,newdata = test.set)
#
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
             data = traning.set)

summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = traning.set)

summary(regressor)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend,
               data = traning.set)

summary(regressor)
y.pred


regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = traning.set)

summary(regressor)