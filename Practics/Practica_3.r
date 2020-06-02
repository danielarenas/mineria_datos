Analise the follow atomation backwardElimination function 

1. Set Working Directory

getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/MultipleLinearRegression")
getwd()
2. Importing the dataset

dataset <- read.csv('50_Startups.csv')
*3. Encoding categorical data

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
4. Splitting the dataset into the Training set and Test set

Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
*5. Atomation BackwardElimination Function

backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
training_set
backwardElimination(training_set, SL)
