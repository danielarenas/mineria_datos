getwd()
setwd("/home/armando/github/Equipo/mineria_datos/Practics")
getwd()

# Importing the dataset
dataset <- read.csv('P2-Movie-Ratings.csv')
dataset
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Budget (million $), SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Budget (million $) ~ YearOfRelease,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearOfRelease, y=training_set$Budget (million $),
             color = 'red') +
  geom_line(aes(x = training_set$YearOfRelease, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Year of release vs Budget (Training Set)') +
  xlab('YearOfRelease') +
  ylab('Budget'))

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$YearOfRelease, y=test_set$Budget (million $),
             color = 'red') +
  geom_line(aes(x = training_set$YearOfRelease, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Year of release vs Experience (Test Set)') +
  xlab('YearOfReleasee') +
  ylab('Budget (million $)'))
