#import data set
data = read.csv('Mall_Customers.csv')

X <- data[4:5]

#using the elbow method 
set.seed(6)
wcss = vector()
for(i in 1:10) {
  wcss[i] <- sum(kmeans(X,i)$withinss)
  }

plot(1:10,wcss,type = 'b',main=paste('elbow graph'),xlab = "no of clusters",
      ylab = "wcss")
#kmeans 

kmeans = kmeans(X ,5, iter.max = 300, nstart =10)
predictions = kmeans$cluster

#visulazing the clusters
#install.packages('cluster')
library(cluster)
clusplot(X,
         predictions,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = FALSE,
         main = paste('Clusters'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')