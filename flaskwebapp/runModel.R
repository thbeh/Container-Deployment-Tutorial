
suppressMessages(library(psych))
suppressMessages(library(jsonlite))
suppressMessages(library(sergeant))
suppressMessages(library(returnsModel))

options(warn = -1)

#* @get /testScore
runScore <- function() {
    RunModellingAndScoringTest(model="OR", returnName="IR6", projectStage="TEST", nrows=1000)
}

#* @post /score
runModel <- function(nr) {
    RunModellingAndScoringTest(model="OR", returnName="IR6", projectStage="TEST", nrows=nr)
}

#* @post /sum
addTwo <- function(a ,b) {
    as.numeric(a) + as.numeric(b)
}
