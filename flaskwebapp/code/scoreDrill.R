
#suppressMessages(library(psych))
#suppressMessages(library(jsonlite))
#suppressMessages(library(sergeant))
suppressMessages(library(returnsModel))

options(warn = -1)

#* @post /predict
runModel <- function(nr) {
    RunModellingAndScoringTest(model="OR", returnName="IR6", projectStage="TEST", nrows=nr)
}

#* @post /domodelling
refreshmodel <- function(model="OR", returnName="IR6", projectStage="TEST", nrows=1000){
    
    RefreshModel(model=model, returnName=returnName, projectStage=projectStage, nrows=nrows)
    
    #output <- RefreshModel(model=model, returnName=returnName, projectStage=projectStage, nrows=nrows)
    #AssignOutput(output, env= environment())
  
    #runDate <- format(Sys.Date(), "%Y-%m-%d")
    #imageName <- paste0("/code/", model,"_", returnName, "_", runDate, "_modelling.RData") 
    #save(list=names(output), file=imageName)
    #imageName
}


#* @post /testload
testload <- function(){
    e <<- .GlobalEnv
    load("/code/OR_IR6_2017-11-28_modelling.RData", envir=e)
    print(e$covYearsBack)
}


#* @post /doscoring
doscoring <- function(model="OR", returnName="IR6", modelRunDate="2017-11-28", projectStage="TEST", nrows=1000, 
              irdNumbersForScoring=""){
    e <<- .GlobalEnv
    imageName <- paste0(model, "_", returnName, "_", modelRunDate, "_modelling.RData")
    load(paste0("/code/", imageName), envir=e)
    
    e$model <- model
    e$returnName <- returnName
    e$modelRunDate <- modelRunDate
    e$projectStage <- projectStage
    e$nrows <- nrows
    e$irdNumbersForScoring <- irdNumbersForScoring
    
    DoScoring(model=e$model, returnName=e$returnName, modelRunDate=e$modelRunDate, projectStage=e$projectStage, 
              nrows=e$nrows, irdNumbersForScoring=e$irdNumbersForScoring, e=e)
    
}