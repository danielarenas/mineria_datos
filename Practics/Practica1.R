n <-10
c<-0

for (i in rnorm (n,mean = 0,sd = 1)) {
  if(i>-1 && i<1){
    c<-c+1
  }
}

r <- c / n
r
