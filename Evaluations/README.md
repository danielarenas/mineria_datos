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


### Exam Unit 4  <a name="id1"></a>
**Instructions**

Develop the following problem with R and RStudio for the knowledge extraction that the problem requires.

Implement the K-Means grouping model with the Iris.csv dataset found at https://github.com/jcromerohdz/iris using the Kmeans () method in R. Once the grouping model is obtained do the corresponding data visualization analysis.

At the end of the development, explain in detail what the K-Means grouping model consists of and what your observations were in the data visualization analysis.

**Assessment instructions**

- Delivery time 4 days.
- At the end put the code and the explanation in the corresponding branch of your github as well as make your explanation of the solution in your google drive.
- Finally defend its development in a video of 8-10 min which will serve to give its rating, this video must be uploaded to YouTube to be shared by a link..


**Code**

```R
#Importar dataset

library(readr)
iris <- read_csv("/home/armando/Documentos/iris.csv")
View(iris)


# Importing the dataset
iris = iris[1:4]
toString(iris, width = NULL)


# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(iris, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = iris, centers = 3)
y_kmeans = kmeans$cluster

# Visualising the clusters
# install.packages("cluster")
library(cluster)
clusplot(iris,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'Length',
         ylab = 'Width')
```


**Results**
![Iris K-means](https://github.com/danielarenas/mineria_datos/blob/Unidad_3/img/Iris%20K-means.png)

**Description**

We can know by the value of K, in this model it will be 3 cluster that represents the number of groupings that are represented in the graph by the 3 spices of iris plants, we can see that the Iris Setosa plant has quantitative characteristics that differ from the other 2 plants that are Iris versicolor and Iris virginica.


**Conclusion**

We can conclude that the Iris setosa plant, which is cluster number 3, is removed from the other 2 plants, iris versicolor and iris virginica, that both in certain species keep certain quantitative similarities, whereas the setosa iris changes in all the samples obtained, their characteristics differentiate them. for quite a bit of the other 2 floors.


