# BataMining
<b><p align="center">
                                                 TECNOLÓGICO NACIONAL DE MÉXICO</br>
                                                INSTITUTO TECNOLÓGICO DE TIJUANA</br>
                                                      SUBDIRECCIÓN ACADÉMICA</br>
                                              DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN</br> 
                                                           PERIODO</br>
                                                      Enero - Junio 2020</br>
                                                           CARRERA</br>
                                               Ing. En Sistemas Computacionales</br>
                                                          ASIGNATURA</br> 
                                                Mineria de Datos (BDD-1703TI9A)</br>
                                                           DOCENTE</br>
                                                Jose Christian Romero Hernandez</br>
                                                           EQUIPO</br>
                                             16210958 - Aguirre Ibarra Jesus Armando</br>
                                             16210783 - Castro Arenas Flavio Daniel</br>                                                                                   
</p></b>

## Unit 2
### Index
[Practice 1](#id1)

[Practice 2](#id2)

[Practice 3](#id3)

[Practice 4](#id4)

[Practice 5](#id5)

[Practice 6](#id6)


### Link to Homeworks
https://drive.google.com/drive/folders/1MU1HrguBuf5ecL9AdSy8L07MM4K1dtuO?usp=sharing


### Practice 1  <a name="id1"></a>
**Instructions**

Use a dataset with real data and implement it in the practice of simple linear regression.


**Code**
```R

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
  geom_line(aes(x = training_set$Year of release, y#importamos el dataset y le asignamos el nombre de df
library(readr)
df <- read_csv("/home/armando/github/DataMining/MachineLearning/SVM/Social_Network_Ads.csv")
View(df)

#delimitamos el dataset con el que vamos a trabajar
df = df[3:5]
head(df)

#Separamos los verdaderos de los falsos o mejor dicho los identificamos
library(caTools)

#Dividimos los datos de entrenamiento y testeo, le damos un margen de 80 a testeo
#obtenemos Entrenamiento 320 de 400 y testeo 80 de 400
resultados = sample.split(df$Purchased, SplitRatio = 0.80)
Entrenamiento = df[resultados==TRUE,]
Testeo = df[resultados == FALSE,]

#Cargamos la libreria class y encontramos la prediccion
#install.packages("class")
library(class)
prediction = knn(train = Entrenamiento, test=Testeo, cl =Entrenamiento$Purchased, k=5)
cm = table(Testeo$Purchased, prediction)

accuracy = sum(diag(cm))/sum(cm)

#Agregamos la libreria que se nos pidio e1071 para hacer proceder con el algoritmo
#de naive bayes

library(e1071)
bayes_classifier = naiveBayes(formula = Purchased ~ ., data = Entrenamiento)
bayes_prediction = predict(bayes_classifier, newdata = Testeo)
cm = table(Testeo$Purchased, prediction)
accuracy = sum(diag(cm))/sum(cm)


#Imprimiemos la prediccion y el caso de exito del algoritmo
cm
accuracy
 = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Year of release vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Budget (million $)')

```
### Practice 2 <a name="id2"> </a>
**Instructions**

Generate the analysis and visualization of data using the multiple linear regression code.

**Code**
```R
getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/MultipleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools)
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor) 

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set) 

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$R.D.Spend, y=training_set$Profit),
             color = 'limegreen', size=2) +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'black') +
  ggtitle('Profit vs R.D.Spend (Training Set)') +
  xlab('R.D.Spend') +
  ylab('Profit')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$R.D.Spend, y=test_set$Profit),
             color = 'forestgreen', size=2) +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'black') +
  ggtitle('Profit vs R.D.Spend (Test Set)') +
  xlab('R.D.Spend') +
  ylab('Profit')


```
### Practice 3 <a name="id3"> </a>
**Instructions**

Explain step by step what the function consists of Backward Elimination.

**Code**
```R
# Analise the follow atomation backwardElimination function 

# [ 1 ]. Set Working Directory
getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/MultipleLinearRegression")
getwd()

# [ 2 ]. Importing the dataset
dataset <- read.csv('50_Startups.csv')

# [ 3 ]. Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
                       
# [ 4 ]. Splitting the dataset into the Training set and Test set
Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# [ 5 ]. Atomation BackwardElimination Function
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
```
### Practice 4 <a name="id4"></a>
**Instructions**

Visualization of the results of the Logistic Regression algorithms.

**Code**
```R
getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/LogisticRegression")
getwd()

dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5] 

library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75) 
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

training_set[, 1:2] <- scale(training_set[, 1:2]) 
test_set[, 1:2] <- scale(test_set[, 1:2]) 

classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set) 

prob_pred = predict(classifier, type = 'response', newdata = test_set[-3]) 
prob_pred 

y_pred = ifelse(prob_pred > 0.5, 1, 0) 
y_pred 

cm = table(test_set[, 3], y_pred)
cm

library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)


library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```



### Practice 5  <a name="id5"></a>
**Instructions**

Change the kernels of the SVM practice, use a dataset that has the same characteristics that were used in the practice.

**Code**
```R
getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/SVM")
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
```

### Practice 6  <a name="id6"></a>
**Instructions**

Perform the decision tree practice using the SVM dataset.

**Code**
```R
getwd()
setwd("C:/Users/Arenas/Documents/ITT/Minería de datos/Datasets/SVM")
getwd()

dataset = read.csv('data_banknote_authentication.csv')
head(dataset)
colnames(dataset) <- c("Variance", "Skewness", "Kurtosis", "Entropy", 
                       "Class")
head(dataset)

columns <- c('Variance', 'Entropy', 'Class')
dataset = dataset[columns]

dataset$Class = factor(dataset$Class, levels = c(0, 1))


library(caTools)
set.seed(123) 
split = sample.split(dataset$Class, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


library(e1071)
classifier = svm(formula = Class ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')

y_pred = predict(classifier, newdata = test_set[-3])
y_pred

cm = table(test_set[, 3], y_pred)
cm


library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Variance', 'Entropy')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Variance of Wavelet Transformed image', 
     ylab = 'Entropy of image',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Variance', 'Entropy')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Variance of Wavelet Transformed image', 
     ylab = 'Entropy of image',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
