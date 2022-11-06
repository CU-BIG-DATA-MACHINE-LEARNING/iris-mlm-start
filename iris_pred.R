#Install Packages
install.packages(c("stats","dplyr","randomForest"))
library(stats)
library(dplyr)
library(randomForest)

View(iris)

#Analyze Data with charts
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width,fill=Species))+geom_tile()
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, fill=Species)) +geom_tile()


#split data to make training dataset
index = sample(2, nrow(iris), replace=TRUE,prob=(c(0.9,0.1)))

#storing my training data in a var
Training = iris[index==1,]
Testing = iris[index==2,]

#Train our MLM
RFM = randomForest(Species~., data=Training)

#Testing Machine Learning model
#sample data
sampledf<- data.frame(Petal.Width=5, Petal.Length=5,Sepal.Width = 5,Sepal.Length=5)

#predict the iris species based off of one set of values
predict(RFM,sampledf)


#Predict based off of test set
Species_Pred =predict(RFM,Testing)
Testing$Species_Pred = Species_Pred
View(Testing)

