suppressMessages(library(psych))
suppressMessages(library(jsonlite))
suppressMessages(library(sergeant))

options(warn = -1)

#* @post /score
doScore <- function(cols, type) {
  ds <- drill_connection(host="mapr-3", port=8047L)
  db <- suppressMessages(drill_query(ds,paste("SELECT ", cols, " FROM `dfs`.`root`.`./poc/FZ/IR/msq.csv2`")))
  mykeys <- make.keys(db,list(EA=c(1:3,-4,-5,-6),TA=c(7:9,-10,-11,-12),EAp =1:3,EAn=4:6,TAp =7:9,TAn=10:12))
  msq.scales <- scoreItems(mykeys,db)
  df <- as.data.frame(get(type,msq.scales))
}

#* @post /sum
addTwo <- function(a, b){
  as.numeric(a) + as.numeric(b)
}
