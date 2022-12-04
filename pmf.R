#DEMO GUIDE
#Single Val Param input = 5, 3
#Multi Val Param input = 3, 12, 3, 0.1, 1.5
#=====================================================================================================

library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile, select = "xyzrn")


#Single or multiple val param (choose one)

option = readline(prompt = "Enter [1] for single val param or [2] for multiple val param: ")

if (option == 1){
  
  windowSize = readline(prompt = "Enter window size: ")
  
  windowSize = as.integer(windowSize)
  
  thresholdSize = readline(prompt = "Enter threshold size: ")
  
  thresholdSize = as.integer(thresholdSize)
  
}else if (option == 2){
  
  windowSize_from = readline(prompt = "Starting element - sequence of window sizes: ")
  
  windowSize_from = as.integer(windowSize_from)
  
  windowSize_to = readline(prompt = "Ending element - sequence of window sizes: ")
  
  windowSize_to = as.integer(windowSize_to)
  
  windowSize_by = readline(prompt = "Diff of element - sequence of window sizes: ")
  
  windowSize_by = as.integer(windowSize_by)
  
  
  thresholdSize_from = readline(prompt = "Starting element - sequence of threshold sizes: ")
  
  thresholdSize_from = as.integer(thresholdSize_from)
  
  thresholdSize_to = readline(prompt = "Ending element - sequence of threshold sizes: ")
  
  thresholdSize_to = as.integer(thresholdSize_to)
  
  windowSize <- seq(windowSize_from, windowSize_to, windowSize_by)
  
  thresholdSize_lengthout = length(windowSize)
  
  thresholdSize <- seq(thresholdSize_from, thresholdSize_to, length.out = thresholdSize_lengthout)
  

}else{
  
  print("Err")
  
}


#Implement PMF algorithm

las <- classify_ground(las, algorithm = pmf(ws = windowSize, th = thresholdSize))


#Plot result

plot(las, color = "Classification", size = 2, bg = "white") 

