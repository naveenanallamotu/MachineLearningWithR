#importing the data
dataset = read.csv("Salary_Data.csv")
install.packages('caTools')
library(caTools)
set.seed(123)
#dividng nto training sets
split <- sample.split(dataset$Salary,SplitRatio = 2/3)
traning.set <- subset(dataset, split==TRUE)
test.set <- subset(dataset, split==FALSE)
# builing the model
Regressor <- lm(formula = Salary ~ YearsExperience , data = traning.set)
# predecting the test results
y_pred = predict(Regressor, newdata = test.set)
#predecting the train result
y_pred2 = predict(Regressor, newdata = traning.set)
# visualizing the model train
#install.packages('ggplot2')
library('ggplot2')
ggplot() +
  geom_point(aes(x = traning.set$YearsExperience, y=traning.set$Salary),
             colour = 'red') +
  geom_line(aes(x = traning.set$YearsExperience, y= y_pred2),
                colour = 'yellow') +
  ggtitle('Salary vs experience(train)') +
  xlab('YearExperience') +
  ylab('Salary')
  
  #visulaizing the model test
ggplot() +
  geom_point(aes(x = test.set$YearsExperience, y=test.set$Salary),
             colour = 'red') +
  geom_line(aes(x = traning.set$YearsExperience, y= y_pred2),
            colour = 'green') +
  ggtitle('Salary vs experience(test)') +
  xlab('YearExperience') +
  ylab('Salary')