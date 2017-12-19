#polynomail regression
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]
#library(caTools)
#seed(123)
#split = sample(dataset$Salary , slipt_ratio =2/3)
#trainset = subset(dataset, split =TRUE)
#testset = subset(dataset , split =FALSE)
#feature scaling
#trainset =scale(trainset)
#testset =scale(testset)
#crreate your regressor
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ . ,
                 data = dataset, type = 'eps-regression')


#predecting the values with linear
y_pred = predict(regressor, data.frame(Level = 6.5))
#visulizaling the Svm
library(ggplot2)

ggplot()+
  geom_point(aes(x= dataset$Level, y= dataset$Salary), color= 'green') +
  geom_line(aes(x = dataset$Level, y= predict(regressor, newdata = dataset)), 
            color ='blue') +
  ggtitle('estimation svm') +
  xlab("Level")
  ylab("Salary")
#visulizaling the Svm high reslution
  X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
  ggplot()+
    geom_point(aes(x= dataset$Level, y= dataset$Salary), color= 'green') +
    geom_line(aes(x = X_grid, y= predict(regressor, newdata = data.frame(Level = X_grid))), 
              color ='blue') +
    ggtitle('estimation svm') +
    xlab("Level") +
  ylab("Salary")