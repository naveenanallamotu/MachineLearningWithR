data1 = read.csv('Position_salaries.csv')

#data subsetting
#data = c(data$Level,data$Salary)
data1 = data1[2:3]
#fitting the linearmodel
linear_regression = lm(formula = Salary ~ .,
                         data = data1)
data1$Level2 = data1$Level^2
data1$Level3 = data1$Level^3
poly_reg =lm(formula = Salary ~ . ,
                       data = data1)

y1 = predict(linear_regression, newdata = data1)
y3 = predict(poly_reg, newdata = data1)

#visulizaling the linear
library(ggplot2)
ggplot() + geom_point(aes(x= data1$Level,y=data1$Salary),color ='green') + 
        geom_line(aes(x=data1$Level, y = y1),color ='red') +
        ggtitle("esitimating the salary(linear)") +
        xlab("level")  +
        ylab("Salary") 
#visulizaling the polynomial
ggplot() + geom_point(aes(x= data1$Level,y=data1$Salary),color ='green') + 
  geom_line(aes(x=data1$Level, y = y3),color ='red') +
  ggtitle("esitimating the salary(polyr)") +
  xlab("level")  +
  ylab("Salary")

#predecting the values with linear
y_linear= predict(linear_regression, data.frame(Level = 6.5))
y_poly = predict(poly_reg, data.frame(Level = 6.5,Level2 = 6.5^2,
                                  Level3 = 6.5^3))