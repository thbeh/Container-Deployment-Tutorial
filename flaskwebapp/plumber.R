library(plumber)
r <- plumb("/usr/local/lib/R/site-library/plumber/examples/04-mean-sum/plumber.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)>
