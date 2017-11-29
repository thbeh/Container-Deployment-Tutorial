
suppressMessages(library(psych))
suppressMessages(library(jsonlite))
suppressMessages(library(sergeant))
suppressMessages(library(returnsModel))

options(warn = -1)

#* @post /score
runModel <- function(nr) {
    RunModellingAndScoring(model="OR", returnName="IR6", projectStage="TEST", nrows=nr)
}

#* @post /sum
addTwo <- function(a ,b) {
    as.numeric(a) + as.numeric(b)
}