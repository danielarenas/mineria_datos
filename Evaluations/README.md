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

# Index 
[Exam Unit 2](#id1)

[Exam Unit 3](#id2)


### Exam Unit 2  <a name="id1"></a>
**Instructions**

Develop the following problem with R and RStudio for the knowledge extraction that the problem requires.


The directors of the movie review website are very happy with their previous delivery and now they have a new requirement for you.


The previous consultant had created a chart for them that is illustrated in the following image.



Graph:
https://drive.google.com/file/d/1wLpy_Jf_-_jvqkBVRoW_-js56broGWWC/view?usp=sharing


However, the R code used to create the graph has been lost and cannot be recovered.


Your task is to create the code that will recreate the same table making it look as close to the original as possible.

You will be provided with a new dataset.

**Track**

- Please note that not all Genres and Studio are used.
- You will need to filter your dataframe after importing the csv file.

**Assessment instructions**
- Delivery time 4 days
- At the end put the source code and the explanation in the corresponding branch of your github likewise make your explanation of the solution in your google drive.
- Finally defend its development in a video of 8-10 min which will serve to give its rating, this video must be uploaded to YouTube to be shared by a link.

***
**Code**

```R
# We add the dataset.
library(readr)
movie <- read_csv("/home/armando/github/DataMining/Datasets/Project-Data.csv")
movie
head(movie)
str(movie)
summary(movie)

# We filter the movies seen in the lost image.
gen_m <- movie[movie$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]
#Filtramos tambien los estudios que aparecen en la imagen perdida
filt_m <- gen_m[gen_m$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

# We create a plot.
library(ggplot2)
gm <- ggplot(data = filt_m, aes(x = Genre, y=`Gross % US`))
gm +geom_boxplot()

# Add jitter to visualize data (dots).
p <- gm + geom_jitter() + geom_boxplot()
p

# We add a little color and we add the Budget and a little statistics.
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot()
p


# If we visualize the plot, there are some outliers with black color, 
#let's limit this outlier and these outliers are the parts of Boxplot.
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot(outlier.colour =NA)
p

# In the diagram above, the box diagram hides many points, let's look at these points using the alpha attribute.
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot(alpha=0.7, outlier.colour =NA)
p

# Now we are just going to add names on the axes.
p <- p +xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
p

# Now what we will change is the size of the font, as well as its color.

p <- p + theme(axis.title.x = element_text(color = "blue", size = 20),
               axis.title.y = element_text(color = "blue", size = 20),
               axis.text.x  = element_text(size = 10),
               axis.text.y  = element_text(size = 10),
               plot.title   = element_text(size = 15),
               legend.title = element_text(size = 15),
               text = element_text(family = "Courier"))

p

# This would be the last step to change the titles on the right side.
p$labels$size <- "Budget $M"
p$labels$colour <- "Studio"
p
```
***
**Results**

https://drive.google.com/file/d/1F3pWTDCGowdmCcRXB8WPx-0Ti0am0q2D/view?usp=sharing


**Description**

The dataset includes more action movies than the other genres, that is why it shows more points located in that genre, the exam asked us to filter by the 5 genera that appear in the graph, which are: action, adventure, animation, comedy and drama, which if we can do successfully, the purpose of making this box diagram is to make a statistical comparison of the distribution of the data of different groups, in our case it was movies by genre.


**Conclusion**

Analyzing the box plot, we can see that the WB and Universal studies are more focused on producing films of the Action genre, which produces more profits for both companies.

***

### Exam Unit 3  <a name="id2"></a>
**Instructions**

Develop the following problem with R and RStudio for the extraction of knowledge that the problem requires.

Implement the Naive Bayes classification model with the Social_Network_Ads.csv data set and using the e1071 library with the naiveBayes () function. Once the classifier is obtained, make the corresponding data visualization analysis.

At the end of the development, explain in detail what the Naive Bayes classification model consists of and also the detailed explanation corresponding to data visualization.

**Code**
```R
#We import the dataset and assign it the name of df.
library(readr)
df <- read_csv("/home/armando/github/DataMining/MachineLearning/SVM/Social_Network_Ads.csv")
View(df)

#We delimit the dataset with which we are going to work.
df = df[3:5]
head(df)

#We separate the true from the false or rather we identify them.
library(caTools)

#We divide the training and testing data, we give a margin of 80 to testing.
#We get Training 320 out of 400 and testing 80 out of 400.
resultados = sample.split(df$Purchased, SplitRatio = 0.80)
Entrenamiento = df[resultados==TRUE,]
Testeo = df[resultados == FALSE,]

#We load the class library and find the prediction.
#install.packages("class")
library(class)
prediction = knn(train = Entrenamiento, test=Testeo, cl =Entrenamiento$Purchased, k=5)
cm = table(Testeo$Purchased, prediction)

accuracy = sum(diag(cm))/sum(cm)

#Add the library that we are asked to e1071 to proceed with the naive bayes algorithm.
library(e1071)
bayes_classifier = naiveBayes(formula = Purchased ~ ., data = Entrenamiento)
bayes_prediction = predict(bayes_classifier, newdata = Testeo)
cm = table(Testeo$Purchased, prediction)
accuracy = sum(diag(cm))/sum(cm)


#We print the prediction and the success case of the algorithm.
cm
accuracy

```

