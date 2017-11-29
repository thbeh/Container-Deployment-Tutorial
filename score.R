#!/usr/bin/env Rscript

library(psych)
library(jsonlite)
library(readr)

options(warn = -1)

selectExpr <- c("active","alert","aroused","sleepy","tired","drowsy","anxious","jittery","nervous","calm","relaxed","at.ease")
me <- c("scores")


data <- read_csv("mydata.csv")
small.msq <- data[selectExpr]
my.keys <- make.keys(small.msq,list(EA = c(1:3,-4,-5,-6), TA = c(7:9,-10,-11,-12), EAp = 1:3, EAn = 4:6, TAp = 7:9, TAn = 10:12))
 msq.scales <- scoreItems(my.keys,small.msq)
# toJSON(msq.scales$scores, pretty=TRUE)   #show the output

df <- as.data.frame(get(me,msq.scales))
toJSON(df, pretty = TRUE)
