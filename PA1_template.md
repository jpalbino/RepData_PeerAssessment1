Assignmet 1

The first step in the assignment is to load the data
The code as follows:

```r
# Loading Setting the working directory
setwd("D:/A Reproducible Research/Peer Assessment 1/data/")
DataSet <- read.csv("activity.csv", header = , T, sep = ",", nrows = 17568, 
    stringsAsFactors = F, check.names = F, comment.char = "", quote = "\"")
```


After loading the original data from file "activity.csv", we can now prepare a subset

```r
# Preprocessing the data: 'correcting' Date and time for usual formating
DataSet$date <- as.Date(DataSet$date, format = "%Y-%m-%d")
```

Using a matrix to simplifly the process

```r
Tabela <- matrix(nrow = 61, ncol = 4)
guarda = (DataSet$date[1])
numero = 0
soma = 0
index <- 1
for (i in 1:17568) {
    if (guarda != DataSet$date[i]) {
        Tabela[index, 1] <- guarda
        Tabela[index, 2] <- as.numeric(soma)
        Tabela[index, 3] <- numero
        guarda <- DataSet$date[i]
        Tabela[index, 4] <- as.numeric(soma)/numero
        numero = 0
        soma = 0
        index <- index + 1
    }
    if (!is.na(DataSet$steps[i])) {
        soma <- soma + DataSet$steps[i]
    }
    numero <- numero + 1
}
## 
```


Answering the first question: What is mean total number of steps taken per day?
For this answer, we made a plot of the total number of steps taken each day in the table above


```r
library(ggplot2)
g <- qplot(as.Date(Tabela[, 1]), as.numeric(Tabela[, 2]))
# 
```


Now, ussing R funcrions to calculate and report the mean and median

```r
mean(as.numeric(Tabela[, 2]))
median(as.numeric(Tabela[, 2]))
## 
```

The results are:
> sum (as.numeric(Tabela[,2]))
[1] 570608
> mean(as.numeric(Tabela[,2]))
[1] 9354.23
> median(as.numeric(Tabela[,2]))
[1] 10395

