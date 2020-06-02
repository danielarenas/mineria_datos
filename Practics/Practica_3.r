# Analise the follow atomation backwardElimination function 

# Backward elimination 
# Variable selection procedure in which all the variables       
# are entered into the equation and then they are excluded one after the other.
# The variable that has the least partial correlation with the dependent
# variable will be the first to be considered for elimination.
# If you meet the deletion criteria, it will be deleted. After having excluded the
# first variable, we will test that variable, of those that remain in the equation,
# that presents a smaller partial correlation. The procedure ends when there are no more
# variables in the equation that satisfy the elimination criterion.

# In R
# Backward selection (or backward elimination), which starts with all predictors  
# in the model (full model),  iteratively removes the least contributive predictors, 
# and stops when you have a model where all predictors are statistically significant.

# [ 1 ] - Set Working Directory
getwd()
setwd("/home/armando/Documentos")
getwd()

# [ 2 ] - Importing the dataset
dataset <- read.csv('50_Startups.csv')

# [ 3 ] - Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

# [ 4 ] - Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# [ 5 ] - Atomation BackwardElimination Function
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
