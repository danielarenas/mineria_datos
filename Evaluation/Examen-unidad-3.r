#importamos el dataset y le asignamos el nombre de df
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



