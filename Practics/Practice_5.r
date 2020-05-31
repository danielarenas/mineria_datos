getwd()
setwd("C:/Users/GitHub/DataMining/MachineLearning/SVM")
getwd()

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3: 5]

dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

install.packages('e1071')
library(e1071)
classifier1 = svm(formula = Purchased ~ .,
                  data = training_set,
                  type = 'C-classification',
                  kernel = 'linear')

classifier2 = svm(formula = Purchased ~ .,
                  data = training_set,
                  type = 'C-classification',
                  kernel = 'polynomial')

classifier3 = svm(formula = Purchased ~ .,
                  data = training_set,
                  type = 'C-classification',
                  kernel = 'radial')

classifier4 = svm(formula = Purchased ~ .,
                  data = training_set,
                  type = 'C-classification',
                  kernel = 'sigmoid')
y_pred1 = predict(classifier1, newdata = test_set[-3])
y_pred2 = predict(classifier2, newdata = test_set[-3])
y_pred3 = predict(classifier3, newdata = test_set[-3])
y_pred4 = predict(classifier4, newdata = test_set[-3])

cm1 = table(test_set[, 3], y_pred1)
cm2 = table(test_set[, 3], y_pred2)
cm3 = table(test_set[, 3], y_pred3)
cm4 = table(test_set[, 3], y_pred4)
cm1
cm2
cm3
cm4

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')

y_grid1 = predict(classifier1, newdata = grid_set)
y_grid2 = predict(classifier2, newdata = grid_set)
y_grid3 = predict(classifier3, newdata = grid_set)
y_grid4 = predict(classifier4, newdata = grid_set)

plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid1), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid1 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid2), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid2 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid3), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid3 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid4), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid4 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')

y_grid1 = predict(classifier1, newdata = grid_set)
y_grid2 = predict(classifier2, newdata = grid_set)
y_grid3 = predict(classifier3, newdata = grid_set)
y_grid4 = predict(classifier4, newdata = grid_set)

plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid1), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid1 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid2), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid2 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid3), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid3 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

contour(X1, X2, matrix(as.numeric(y_grid4), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid4 == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
