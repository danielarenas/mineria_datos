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
  geom_line(aes(x = training_set$Year of release, y = predict(regressor, newdata = training_set)),
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

**Code**




### Practice 5  <a name="id5"></a>
**Instructions**




### Practice 6  <a name="id6"></a>
**Instructions**
