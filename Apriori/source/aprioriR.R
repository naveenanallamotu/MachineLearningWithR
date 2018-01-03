#apriori


data = read.csv('Market_Basket_Optimisation.csv' ,header = FALSE
# we need find the association of the rules,to optimizes the sales. Each customer of bought only once aweek
# the lines coresspond to basket of customer
#it takes parse matrix contains larger numbe of zero 
#transform data into parse matrix
#we make each product as each colunms
#install.packages('arules')
library(arules)
# it might have the duplicates in it
data = read.transactions('Market_Basket_Optimisation.csv', sep =',', rm.duplicates = TRUE)
summary(data)
itemFrequencyPlot(data, topN=10)
# training the apriori model
rules = apriori(data = data,parameter = list(support =0.004 , confidence =0.2))
# support only three times a day need to sell here above  7*3/7500

inspect(sort(rules,by='lift')[1:10])

