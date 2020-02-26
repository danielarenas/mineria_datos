# [ 1 ] Rnorm ejecuta numero entre intervalos del -1 al 1
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

# [ 2 ] Guarda todos los valores en x y le sacas el minimo maximo.
x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

# [ 3 ] Crear un histograma en grafico
hist(rnorm(200)) 

# [ 4 ] Mostrar todos los valores desglozados de x para crear un diagrama de densidad
density(x)

# [ 5 ] Crear un diagrama de densidad
plot(density(x))

# [ 6 ] Sobre poner un histograma en un diagrama de densidad
hist(x, freq = F)
lines(density(x))

# [ 7 ] funcion en inversa
inverso <- function(x) {
  x <- 1 / x
  return(x)
}
inverso(8)

# [ 8 ] inverso
z <- c(1,2,3)
t <- c("uno","dos","tres")
z; t
z

# [ 9 ] Asignar valores de numeros y en numbres
y <- c(2,4,6)  # Asigna 3 valores a la variable x
names(y) <- c("I","II","III")  # Asigna nombres a los 3 valores anteriores
y

# [ 10 ] calcula la raiz
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














