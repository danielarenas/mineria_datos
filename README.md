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

## Unit 1
### Index
[Practice 1](#id1)

[Practice 2](#id2)

[Practice 3](#id3)

[Practice 4](#id4)

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

**Code**
