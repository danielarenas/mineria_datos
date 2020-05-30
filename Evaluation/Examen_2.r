#Agregams el archivo.
library(readr)
movie <- read_csv("~/ITT/Mineria de datos/Datasets/Project-Data.csv")
View(Project_Data)
head(movie)
str(movie)
summary(movie)

#Filtramos las peliculas vistas en la imagen perdida
gen_m <- movie[movie$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]
#Filtramos tambien los estudios que aparecen en la imagen perdida
filt_m <- gen_m[gen_m$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

#Creamos un plot
library(ggplot2)
gm <- ggplot(data = filt_m, aes(x = Genre, y=`Gross % US`))
gm +geom_boxplot()

#Añadimos jitter para visualizar datos (puntitos)
p <- gm + geom_jitter() + geom_boxplot()
p

#Agregamos un poco de color y le agregamos el Budget y un poco de estadistica
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot()
p


#Si visualizamos la trama, hay algunos valores atipico con color negro, 
#eliminemos este valor atipico y estos valores atipico son las partes de Boxplot
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot(outlier.colour =NA)
p

#En el diagrama anterior, el diagrama de caja oculta muchos puntos, veamos estos puntos usando el atributo alfa
p<-gm +geom_jitter(aes(size = `Budget ($mill)`, color=Studio)) +geom_boxplot(alpha=0.7, outlier.colour =NA)
p

#Ahora solo vamos a agregarle nombres en las ejes
p <- p +xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
p
#Ahora lo que cambiaremos es el tamaÃ±o de la fuente, asi como su color

p <- p + theme(axis.title.x = element_text(color = "purple", size = 20) ,
               axis.title.y = element_text(color = "purple", size = 20) ,
               axis.text.x  = element_text(size = 10),
               axis.text.y  = element_text(size = 10),
               plot.title   = element_text(size = 15),
               legend.title = element_text(size = 15),
               text = element_text(family = "Courier"))

p

#Este seria el ultimo paso para cambiar los titulos del lado derecho
p$labels$size <- "Budget $M"
p$labels$colour <- "Studio"
p
