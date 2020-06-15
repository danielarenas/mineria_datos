
# BataMining


# DataMining

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




## Exam Unit 4
![For more information click here.](https://github.com/danielarenas/mineria_datos/tree/Unidad_3/Evaluations)

## Unit 1
### Index
[Practice 1](#id1)

[Practice 2](#id2)

[Practice 3](#id3)

[Practice 4](#id4)

[Practice 5](#id5)

### Practice 1  <a name="id1"></a>
**Instructions**


Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

You know that E(X) = 68.2%
Check that Mean(Xn)->E(X) as you rerun your script while increasing N

Hint:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

**Code**
```r

n <-10
c<-0

for (i in rnorm (n,mean = 0,sd = 1)) {
  if(i>-1 && i<1){
    c<-c+1
  }
}

r <- c / n
r
```
### Practice 2 <a name="id2"> </a>
**Instructions**

Functions

Practice find 20 more functions in R and make an example of it.

**Code**
```r
# [ 1 ] Rnorm executes number between intervals from -1 to 1
df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df$a <- (df$a - min(df$a, na.rm = TRUE)) /
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) /
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) /
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) /
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

# [ 2 ] Save all values in x and you get the minimum maximum.
x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

# [ 3 ] Create a graph histogram
hist(rnorm(200)) 

# [ 4 ] Show all broken down values of x to create a density diagram.
density(x)

# [ 5 ] Create a density diagram.
plot(density(x))

# [ 6 ] About putting a histogram on a density diagram.
hist(x, freq = F)
lines(density(x))

# [ 7 ] inverse function.
inverso <- function(x) {
  x <- 1 / x
  return(x)
}
inverso(8)

# [ 8 ] reverse
z <- c(1,2,3)
t <- c("uno","dos","tres")
z; t
z

# [ 9 ] Assign values of numbers and names.
y <- c(2,4,6)  # Asigna 3 valores a la variable x
names(y) <- c("I","II","III")  # Asigna nombres a los 3 valores anteriores
y

# [ 10 ] calculate the root
sqrt(9)

# ---------------------------------------------
data(InsectSprays)
aov.spray <- aov(sqrt(count)~spray,data=InsectSprays)
aov.spray <- aov(sqrt(InsectSprays[,1])~InsectSprays[,2]) 

# [ 11 ] The aov or lm function returns a list where the different 
# elements corresponding to the results of analasis.
str(aov.spray, max.level = -1)

# [ 12 ] Display the names of the object.
names(aov.spray)

# [ 13 ] Create a list in which, in the case of aov (), it is simply a test table.
str(summary(aov.spray))

# [ 14 ] Returns the estimated coefficients (sometimes with standard errors).
str(coef(aov.spray))

# [ 15 ] Returns the residuals.
str(residuals(aov.spray))

# [ 16 ] Returns the deviation.
str(deviance(aov.spray))

# [ 17 ] Returns the adjusted values.
str(fitted(aov.spray))

# [ 18 ] calculate the factorial of a number
factorial <- function(x,y) {
  prod(1:x)
  }
factorial(4)

# [ 19 ] function that adds two numbers
sumanumeros <- function(x,y) {
  (x+y)
}
sumanumeros(4,2)

# [ 20 ] Function that compares two vectors, returns vector with the largest values.
grande <- function(x,y){
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}
grande(c(9,8,7,9,9),c(1,6,2,7,3))

```
### Practice 3 <a name="id3"> </a>
**Instructions**

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

Hint 1

Use:

round()

mean()

max()

min()

**Code**
```r
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, 2)
tax 

#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin

#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M
```
### Practice 4 <a name="id4"></a>

**Instructions**

You have only been supplied vectors. You will need to create the matrices yourself.

Matrices:

- FreeThrows
- FreeThrowAttempts

Kirill Eremenko

www.superdatascience.com

Copyright: These datasets were prepared using publicly available data. However, theses scripts are subject to Copyright Laws. If you wish to use these R scripts outside of the R Programming Course by Kirill Eremenko, you may do so by referencing www.superdatascience.com in your work.

Comments:

Seasons are labeled based on the first year in the season

E.g. the 2012-2013 season is preseneted as simply 2012

Notes and Corrections to the data:

Kevin Durant: 2006 - College Data Used

Kevin Durant: 2005 - Proxied With 2006 Data

Derrick Rose: 2012 - Did Not Play

Derrick Rose: 2007 - College Data Used

Derrick Rose: 2006 - Proxied With 2007 Data

Derrick Rose: 2005 - Proxied With 2007 Data

**Code**
```r

#Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)

#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#Rename the columns
colnames(FreeThrows) <- Seasons
#Rename the rows
rownames(FreeThrows) <- Players

#Check the matrix
FreeThrows

#Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)

#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}


#Visualize the new matrices
myplot(FreeThrows)
myplot(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
myplot(FreeThrowAttempts/Games)


#Part 2 - Free Throw Accuracy
myplot(FreeThrows/ FreeThrowAttempts)


#Field Goal Accuracy was exceptional:
myplot(FieldGoals/FieldGoalAttempts)


#Part 3 - Player Style Patterns Excluding Free Throws
myplot((Points-FieldGoals)/FreeThrows)
```

### Practice 5 <a name="id5"></a>
**Instructions**
1. Importing Data into R
2. Exploring Datasets: head(), tail(), summary(), str()
3. Using the $ sing
4. Basic operations with Data Frames
5. Filtering a Data Frame
6. Introduction to qplot
7. Visualizing with qplot: Part I
8. Buildign Data Frames: data.frame()
9. Marging Data Frames: marge()
10. Visualizing with qplot: Part II

**Code**
```r
#Practice 5

#Filter countries by Low income

stats[stats$Income.Group=="Low income",]

#Filter countries by Lower middle income

stats[stats$Income.Group=="Lower middle income",]

#Filter countries by Upper middle income

stats[stats$Income.Group=="Upper middle income",]

#Filter by countrie Malta

stats[stats$Country.Name=="Malta",]

#Filter by countrie Qatar

stats[stats$Country.Name== "Qatar",]

#Filter by countrie Netherlands

stats[stats$Country.Name== "Netherlands",]

#Filter by countrie Norway

stats[stats$Country.Name== "Norway",]
```

