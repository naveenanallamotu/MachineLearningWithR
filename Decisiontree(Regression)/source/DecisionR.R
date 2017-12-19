#decision tree
dataset = read.csv("Position_salaries.csv")
dataset = dataset[2:3]
#install.packages("rpart")
library(rpart)
regressor = rpart(formula = Salary ~ .,
                      data = dataset , 
                  control = rpart.control(minsplit = 1))
y_pred = predict(regressor, data.frame(Level = 6.5))
library(ggplot2)

ggplot()+
  geom_point(aes(x= dataset$Level, y= dataset$Salary), color= 'green') +
  geom_line(aes(x = dataset$Level, y= predict(regressor, newdata = dataset)), 
            color ='blue') +
  ggtitle('estimation decision') +
  xlab("Level")
ylab("Salary")
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot()+
  geom_point(aes(x= dataset$Level, y= dataset$Salary), color= 'green') +
  geom_line(aes(x = X_grid, y= predict(regressor, newdata = data.frame(Level = X_grid))), 
            color ='blue') +
  ggtitle('estimation decision') +
  xlab("Level") +
  ylab("Salary")