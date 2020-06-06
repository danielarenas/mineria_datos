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
[Homework 1](#idA)

[Homework 2](#idB)

[Homework 3](#idC)

[Homework 4](#idD)

[Homework 5](#idE)

[Homework 6](#idF)

[Homework 7](#idG)


### Link to Homeworks in Google Drive
https://drive.google.com/drive/folders/1MU1HrguBuf5ecL9AdSy8L07MM4K1dtuO?usp=sharing


### Homework 1  <a name="idA"></a>
**Instructions**

Investigate the geometry layer and the grammar of the graphs.

#### The grammar of graphics
```R
library(tidyverse)
library(knitr)
```
**Introduction**

Google defines a grammar as “the whole system and structure of a language or of languages in general, usually taken as consisting of syntax and morphology (including inflections) and sometimes also phonology and semantics”. Others consider a grammar to be “the fundamental principles or rules of an art or science”. Applied to visualizations, a grammar of graphics is a grammar used to describe and create a wide range of statistical graphics.
The layered grammar of graphics approach is implemented in ggplot2, a widely used graphics library for R. All graphics in this library are built using a layered approach, building layers up to create the final graphic.


**Components of the layered grammar of graphics**

  * [Layer](#id1)
      * [Data](#id1.1)
      * [Mapping](#id1.2)
      * [Statistical transformation (stat)](#id1.3)
      * [Geometric object (geom)](#id1.4)
      * [Position adjustment (position)](#id1.5)
  * [Scale](#id2)
  * [Coordinate system (coord)](#id3)
  * [Faceting (facet)](#id4)
  * [Defaults](#id5)
      * [Data](#id5.1)
      * [Mapping](#id5.2)


**Layer** <a name="id1"></a>

Layers are used to create the objects on a plot. They are defined by five basic parts:

  1. Data
  2. Mapping
  3. Statistical transformation (stat)
  4. Geometric object (geom)
  5. Position adjustment (position)

Layers are typically related to one another and share many common features. For instance, multiple layers can be built using the same underlying data. An example would be a scatterplot overlayed with a smoothed regression line to summarize the relationship between two variables:

![A plot with two layers](https://cfss.uchicago.edu/notes/grammar-of-graphics_files/figure-html/layers-1.png)


**Data and mapping** <a name="id1.1"></a> <a name="id1.2"></a> <a name="id5.1"></a> <a name="id5.2"></a>

Data defines the source of the information to be visualized, but is independent from the other elements. So a layered graphic can be built which utilizes different data sources while keeping the other components the same.

For our running example, let’s use the ```mpg``` dataset in the ```ggplot2``` package.

```R
head(x = mpg) %>%
  kable(caption = "Dataset of automobiles")
```
<center>
  
![xample use the mpg dataset in the ggplot2 package](https://raw.githubusercontent.com/danielarenas/mineria_datos/Unidad_2/img/The%20grammar%20of%20graphics%20Computing.png)

</center>

Mapping defines how the variables are applied to the plot. So if we were graphing information from ```mpg```, we might map a car’s engine displacement to the
position and highway mileage to the "y" position.
```R
mpg %>%
  select(displ, hwy) %>%
  rename(x = displ,
         y = hwy)
```
```R
## # A tibble: 234 x 2
##        x     y
##    <dbl> <int>
##  1   1.8    29
##  2   1.8    29
##  3   2      31
##  4   2      30
##  5   2.8    26
##  6   2.8    26
##  7   3.1    27
##  8   1.8    26
##  9   1.8    25
## 10   2      28
## # … with 224 more rows
```


**Statistical transformation** <a name="id1.3"></a>

A statistical transformation (stat) transforms the data, generally by summarizing the information. For instance, in a bar graph you typically are not trying to graph the raw data because this doesn’t make any inherent sense. Instead, you might summarize the data by graphing the total number of observations within a set of categories. Or if you have a dataset with many observations, you might transform the data into a smoothing line which summarizes the overall pattern of the relationship between variables by calculating the mean of y conditional on x.


A stat is a function that takes in a dataset as the input and returns a dataset as the output; a stat can add new variables to the original dataset, or create an entirely new dataset. So instead of graphing this data in its raw form:

```R
mpg %>%
  select(cyl)
```
```R
## # A tibble: 234 x 1
##      cyl
##    <int>
##  1     4
##  2     4
##  3     4
##  4     4
##  5     6
##  6     6
##  7     6
##  8     4
##  9     4
## 10     4
## # … with 224 more rows
```
You would transform it to:
```R
mpg %>%
  count(cyl)
```
```R
## # A tibble: 4 x 2
##     cyl     n
##   <int> <int>
## 1     4    81
## 2     5     4
## 3     6    79
## 4     8    70

```


**Geometric objects** <a name="id1.4"></a>

Geometric objects (geoms) control the type of plot you create. Geoms are classified by their dimensionality:

   * 0 dimensions - point, text
   * 1 dimension - path, line
   * 2 dimensions - polygon, interval

Each geom can only display certain aesthetics or visual attributes of the geom. For example, a point geom has position, color, shape, and size aesthetics.
```R
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  ggtitle("A point geom with position and color aesthetics")
```
![geom point](https://raw.githubusercontent.com/danielarenas/mineria_datos/Unidad_2/img/geom_point-1.png)

   * Position defines where each point is drawn on the plot
   * Color defines the color of each point. Here the color is determined by the class of the car (observation)
  
Whereas a bar geom has position, height, width, and fill color.
```R
ggplot(data = mpg, aes(x = cyl)) +
  geom_bar() +
  ggtitle("A bar geom with position and height aesthetics")
```
![geom bar](https://raw.githubusercontent.com/danielarenas/mineria_datos/Unidad_2/img/geom_bar-1.png)

  * Position determines the starting location (origin) of each bar
  * Height determines how tall to draw the bar. Here the height is based on the number of observations in the dataset for each possible number of cylinders.


  
**Position adjustment** <a name="id1.5"></a>

Sometimes with dense data we need to adjust the position of elements on the plot, otherwise data points might obscure one another. Bar plots frequently stack or dodge the bars to avoid overlap:
```R
count(x = mpg, class, cyl) %>%
  ggplot(mapping = aes(x = cyl, y = n, fill = class)) +
  geom_bar(stat = "identity") +
  ggtitle(label = "A stacked bar chart")
```
![position dodge 1](https://raw.githubusercontent.com/danielarenas/mineria_datos/Unidad_2/img/position_dodge-1.png)

```R
count(x = mpg, class, cyl) %>%
  ggplot(mapping = aes(x = cyl, y = n, fill = class)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle(label = "A dodged bar chart")
```
![position dodge 2](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/position_dodge-2.png)

Sometimes scatterplots with few unique and values are jittered (random noise is added) to reduce overplotting.
```R
ggplot(data = mpg, mapping = aes(x = cyl, y = hwy)) +
  geom_point() +
  ggtitle("A point geom with obscured data points")
```
![position 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/position-1.png)
```R
ggplot(data = mpg, mapping = aes(x = cyl, y = hwy)) +
  geom_jitter() +
  ggtitle("A point geom with jittered data points")
```
![position 2](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/position-2.png)



**Scale** <a name="id2"></a>

A scale controls how data is mapped to aesthetic attributes, so we need one scale for every aesthetic property employed in a layer. For example, this graph defines a scale for color:
```R
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  guides(color = guide_legend(override.aes = list(size = 4)))
```
![scale color 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/scale_color-1.png)

Note that the scale is consistent - every point for a compact car is drawn in tan, whereas SUVs are drawn in pink. The scale can be changed to use a different color palette:
```R
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  guides(color = guide_legend(override.aes = list(size = 4))) +
  scale_color_brewer(palette = "Dark2")
```
![scale color palette 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/scale_color_palette-1.png)

Now we are using a different palette, but the scale is still consistent: all compact cars utilize the same color, whereas SUVs use a new color but each SUV still uses the same, consistent color.



**Coordinate system** <a name="id3"></a>

A coordinate system (coord) maps the position of objects onto the plane of the plot, and controls how the axes and grid lines are drawn. Plots typically use two coordinates (x, y), but could use any number of coordinates. Most plots are drawn using the Cartesian coordinate system:
```R
x1 <- c(1, 10)
y1 <- c(1, 5)
p <- qplot(x = x1, y = y1, geom = "blank", xlab = NULL, ylab = NULL) +
  theme_bw()
p +
  ggtitle(label = "Cartesian coordinate system")
```
![coord cart 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/coord_cart-1.png)

This system requires a fixed and equal spacing between values on the axes. That is, the graph draws the same distance between 1 and 2 as it does between 5 and 6. The graph could be drawn using a semi-log coordinate system which logarithmically compresses the distance on an axis:
```R
p +
  coord_trans(y = "log10") +
  ggtitle(label = "Semi-log coordinate system")
```
![coord semi log 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/coord_semi_log-1.png)

Or could even be drawn using polar coordinates:

```R
p +
  coord_polar() +
  ggtitle(label = "Polar coordinate system")
```
![coord polar 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/coord_polar-1.png)



**Faceting** <a name="id4"> </a>

Faceting can be used to split the data up into subsets of the entire dataset. This is a powerful tool when investigating whether patterns are the same or different across conditions, and allows the subsets to be visualized on the same plot (known as conditioned or trellis plots). The faceting specification describes which variables should be used to split up the data, and how they should be arranged.
```R
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class)
```
![facet 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/facet-1.png)



**Defaults** <a name="id5"> </a>

Rather than explicitly declaring each component of a layered graphic (which will use more code and introduces opportunities for errors), we can establish intelligent defaults for specific geoms and scales. For instance, whenever we want to use a bar geom, we can default to using a stat that counts the number of observations in each group of our variable in the x position.

Consider the following scenario: you wish to generate a scatterplot visualizing the relationship between engine displacement size and highway fuel efficiency. With no defaults, the code to generate this graph is:
```R
ggplot() +
  layer(
    data = mpg, mapping = aes(x = displ, y = hwy),
    geom = "point", stat = "identity", position = "identity"
  ) +
  scale_x_continuous() +
  scale_y_continuous() +
  coord_cartesian()
```
![default 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/default-1.png)

The above code:

  * Creates a new plot object (```ggplot```)
  * Adds a layer (```layer```)
    * Specifies the data (```mpg```)
    * Maps engine displacement to the x position and highway mileage to the y position (```mapping```)
    * Uses the point geometric transformation (```geom = "point"```)
    * Implements an identity transformation and position (```stat = "identity"``` and ```position = "identity"```)
  * Establishes two continuous position scales (```scale_x_continuous``` and ```scale_y_continuous```)
  * Declares a cartesian coordinate system (```coord_cartesian```)

How can we simplify this using intelligent defaults?

  1. We only need to specify one geom and stat, since each geom has a default stat.
  2. Cartesian coordinate systems are most commonly used, so it should be the default.
  3. Default scales can be added based on the aesthetic and type of variables.
    * Continuous values are transformed with a linear scaling.
    * Discrete values are mapped to integers.
    * Scales for aesthetics such as color, fill, and size can also be intelligently defaulted.

Using these defaults, we can rewrite the above code as:
```R
ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy))
```
![default2 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/default2-1.png)

This generates the exact same plot, but uses fewer lines of code. Because multiple layers can use the same components (data, mapping, etc.), we can also specify that information in the ```ggplot()``` function rather than in the ```layer()``` function:
```R
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point()
```
![default3 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/default3-1.png)

And as we will learn, function arguments in R use specific ordering, so we can omit the explicit call to ```data``` and ```mapping```:
```R
ggplot(mpg, aes(displ, hwy)) +
  geom_point()
```
![default4 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/default4-1.png)

With this specification, it is easy to build the graphic up with additional layers, without modifying the original code:

```R
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()
```
```R
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```
![default5 1](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/default5-1.png)

Because we called ```aes(displ, hwy)``` within the ```ggplot()``` function, it is automatically passed along to both ```geom_point()``` and ```geom_smooth()```. If we fail to do this, we get an error:

```R
ggplot(mpg) +
  geom_point(aes(displ, hwy)) +
  geom_smooth()
```
```R
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```
```R
## Error: stat_smooth requires the following missing aesthetics: x, y
```


**Session Info**
### Homework 2 <a name="idB"> </a>
**Instructions**

Investigate the geom_jitter () function.


#### geom_jitter
**Jittered points**

The jitter geom is a convenient shortcut for ```geom_point(position = "jitter")```. It adds a small amount of random variation to the location of each point, and is a useful way of handling overplotting caused by discreteness in smaller datasets.


**Usage**
```R
geom_jitter(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "jitter",
  ...,
  width = NULL,
  height = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)
```
![geom jitter](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/geom_jitter.png)



**Aesthetics**

```geom_point()``` understands the following aesthetics (required aesthetics are in bold):

* x
* y
* alpha
* colour
* fill
* group
* shape
* size
* stroke

Learn more about setting these aesthetics in ```vignette("ggplot2-specs")```.



**See Also**

```geom_point()``` for regular, unjittered points, ```geom_boxplot()``` for another way of looking at the conditional distribution of a variable



**Examples**
```R
# NOT RUN {
p <- ggplot(mpg, aes(cyl, hwy))
p + geom_point()
p + geom_jitter()

# Add aesthetic mappings
p + geom_jitter(aes(colour = class))

# Use smaller width/height to emphasise categories
ggplot(mpg, aes(cyl, hwy)) + geom_jitter()
ggplot(mpg, aes(cyl, hwy)) + geom_jitter(width = 0.25)

# Use larger width/height to completely smooth away discreteness
ggplot(mpg, aes(cty, hwy)) + geom_jitter()
ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.5, height = 0.5)
# }
```

### Homework 3 <a name="idC"> </a>
**Instructions**

Find out about the P value.


**What is a p-value?**

The p-value is actually the probability of getting a sample like ours, or more extreme than ours IF the null hypothesis is true. So, we assume the null hypothesis is true and then determine how “strange” our sample really is. If it is not that strange (a large p-value) then we don’t change our mind about the null hypothesis. As the p-value gets smaller, we start wondering if the null really is true and well maybe we should change our minds (and reject the null hypothesis).

A little more detail: A small p-value indicates that by pure luck alone, it would be unlikely to get a sample like the one we have if the null hypothesis is true. If this is small enough we start thinking that maybe we aren’t super lucky and instead our assumption about the null being true is wrong. Thats why we reject with a small p-value.

A large p-value indicates that it would be pretty normal to get a sample like ours if the null hypothesis is true. So you can see, there is no reason here to change our minds like we did with a small p-value.


### Homework 4 <a name="idD"></a>
**Instructions**

Investigate the SplitRatio() and lm() function.



**SplitRatio**

Description
Divide the vector Y data into two sets in a predefined relationship while preserving the relative relationships of different Y labels. It is used to divide the data used during classification into train and test subsets.


**Usage**

```R
sample.split( Y, SplitRatio = 2/3, group = NULL )
```

![SplitRatio function](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/SplitRatio.png)



**lm**

```lm``` is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although ```aov``` may provide a more convenient interface for these).


**Usage**
```R
lm(formula, data, subset, weights, na.action,
   method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
   singular.ok = TRUE, contrasts = NULL, offset, …)
```
![lm() function](https://github.com/danielarenas/mineria_datos/blob/Unidad_2/img/lm.png)


**Datails**

Models for ```lm``` are specified symbolically. A typical model has the form ```response ~ terms``` where ```response``` is the (numeric) response vector and ```terms``` is a series of terms which specifies a linear predictor for ```response```. A terms specification of the form ```first + second``` indicates all the terms in ```first``` together with all the terms in ```second``` with duplicates removed. A specification of the form ```first:second``` indicates the set of terms obtained by taking the interactions of all terms in ```first``` with all terms in ```second```. The specification ```first*second``` indicates the cross of ```first``` and ```second```. This is the same as ```first + second + first:second```.

If the formula includes an ```offset```, this is evaluated and subtracted from the response.

If ```response``` is a matrix a linear model is fitted separately by least-squares to each column of the matrix.

See ```model.matrix``` for some further details. The terms in the formula will be re-ordered so that main effects come first, followed by the interactions, all second-order, all third-order and so on: to avoid this pass a ```terms``` object as the formula (see ```aov``` and ```demo(glm.vr)``` for an example).

A formula has an implied intercept term. To remove this use either ```y ~ x - 1``` or ```y ~ 0 + x```. See ```formula``` for more details of allowed formulae.

Non-```NULL``` ```weights``` can be used to indicate that different observations have different variances (with the values in ```weights``` being inversely proportional to the variances); or equivalently, when the elements of ```weights``` are positive integers wi, that each response yi is the mean of wi unit-weight observations (including the case that there are wi observations equal to yi and the data have been summarized). However, in the latter case, notice that within-group variation is not used. Therefore, the sigma estimate and residual degrees of freedom may be suboptimal; in the case of replication weights, even wrong. Hence, standard errors and analysis of variance tables should be treated with care.

```lm``` calls the lower level functions ```lm.fit```, etc, see below, for the actual numerical computations. For programming only, you may consider doing likewise.

All of ```weights```, ```subset``` and ```offset``` are evaluated in the same way as variables in ```formula```, that is first in ```data``` and then in the environment of ```formula```.

**Value**

```lm``` returns an object of ```class``` ```"lm"``` or for multiple responses of class ```c("mlm", "lm")```.

The functions ```summary``` and ```anova``` are used to obtain and print a summary and analysis of variance table of the results. The generic accessor functions ```coefficients```, ```effects```, ```fitted.values``` and ```residuals``` extract various useful features of the value returned by ```lm```.

An object of class ```"lm"``` is a list containing at least the following components:

* ***coefficients***: a named vector of coefficients 
* ***residuals***: the residuals, that is response minus fitted values.
* ***fitted.values***: the fitted mean values.
* ***rank***: the numeric rank of the fitted linear model.
* ***weights***: (only for weighted fits) the specified weights.
* ***df.residual***: the residual degrees of freedom.
* ***call***: the matched call.
* ***terms***: the terms object used.
* ***contrasts***: (only where relevant) the contrasts used.
* ***xlevels***: (only where relevant) a record of the levels of the factors used in fitting.
* ***offset***: the offset used (missing if none were used).
* ***y***: if requested, the response used.
* ***x***: if requested, the model matrix used.
* ***model***: if requested (the default), the model frame used.
* ***na.action***: (where relevant) information returned by model.frame on the special handling of NAs.



### Homework 5  <a name="idE"></a>
**Instructions**

Investigate the gml() function.


The glm () function of R allows us to fit linear models of many types, including those we fit with lm (), Poisson models, and the logit we will focus on. The basic syntax for obtaining a linear model is
```R
glm(dependiente~independiente1+independiente2, 
    family=binomial(), 
    data=datos").
```

The first argument is an object of the formula class. To the left of the sign ~ we place the dependent variable and to the right, joined by the sign + the independent ones, if we are not specifying an interaction between variables.

The second, ```family = binomial ()```, specifies the probability function that we will use. For logit models it is a binomial function. Within the parentheses the link function can be specified. For the binomial distribution family ```glm()``` by default use a logit function. If we are interested in a probit function we should specify ```link = probit```.

The third one points to a ```data.frame``` where the data is. The column names in the ```data.frame``` must match the variables specified in the formula, although it could contain more variables that will be discarded. In the case of previously doing a data manipulation chained with the operator ```%>%``` we use. as an anonymous substitute for data.


### Homework 6  <a name="idF"></a>
**Instructions**

Inquire about the ElemStatLearn () package


| Name | Description |
| ---------- | ---------- |
| waveform   | Function to simulate waveform data  |
| phoneme   | Data From a Acoustic-Phonetic Continuous Speech Corpus  |
| prostate   | Prostate Cancer Data   |
| waveform.test   | Simulated Waveform Data   |
| vowel.train  | Vowel Recognition (Deterding data)   |
| vowel.test  | Vowel Recognition (Deterding data)   |
| orange4.train   | Simulated Orange Data   |
| zip.train   | Handwritten Digit Recognition Data   |
| zip2image   | function to convert row of zip file to format used by image()   |
| ozone  | Ozone Data  |
| waveform.train   | Simulated Waveform Data  |
| zip.test   | Handwritten Digit Recognition Data   |
| simple.ridge   | Simple Ridge Regression   |
| galaxy   | Galaxy Data  |
| spam   | Email Spam Data  |
| nci   | NCI microarray data (chap 14)   |
| countries  | Country Dissimilarities  |
| orange10.train   | Simulated Orange Data   |
| orange4.test   | Simulated Orange Data   |
| SAheart  | South African Hearth Disease Data  |
| marketing  | Market Basket Analysis  |
| mixture.example  | Mixture Example  |
| bone  | Bone Mineral Density Data   |
| orange10.test  | Simulated Orange Data   |


### Homework 7  <a name="idG"></a>
**Instructions**

Conduct an essay on BodyPartRecognition.


**Introduction**

Recognition of human body parts was possible but it was complicated because there were no deep recognition cameras. This changed with the arrival of the Xbox 360 kinect, which had the computational capacity to run at 200 frames per second, but had the problem of recognizing parts of the human body in real time without having much computational cost, without losing efficiency and having a good recognition.


**Classification method used**

The method used was Random Forest, this classification method offers a quick and efficient classification when comparing the image of our body with the large image database.


**Complications**

The complications that were found are not reaching the overfitting, so as not to harm the interaction in real time, it was found that reaching a depth of 20 in the tree, the overfitting begins to be reached, but at a depth of 10 it is not reached. of overfit, many training images are not used compared to the depth of 20 and a good result is achieved.

Compared with the K-neighborhood algorithm, it has a better performance of thousandths of a second, with K-neighborhood you have to find the images 5 cm apart from the joints and fill in the spaces depending on the results.


**Conclusion**

The good use of the classification algorithm, in this case Random-Forest, can be made good classification by performing a good analysis of the problem and having a good training database, carrying out tests and readjusting our parameters, evaluating required times and without reaching an over-adjustment.
