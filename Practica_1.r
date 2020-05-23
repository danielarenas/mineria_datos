getwd()
setwd("/home/danie/Documentos/mineria_datos/P2-Movie-Ratings.csv")
getwd()

# Importing the dataset
dataset <- read.csv('P2-Movie-Ratings.cs')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools)
library(caTools)
set.seed(123)
split <- sample.split(dataset$Budget (million $), SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Budget (million $) ~ Year of release,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Year of release, y=training_set$Budget (million $)),
             color = 'red') +
  geom_line(aes(x = training_set$Year of release, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Year of release vs Budget (Training Set)') +
  xlab('Year of release') +
  ylab('Budget (million $')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$Year of release, y=test_set$Budget (million $),
             color = 'red') +
  geom_line(aes(x = training_set$Year of release, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Year of release vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Budget (million $)')
