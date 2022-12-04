#DEMO GUIDE
#If choose 1, the program will perform default calculation
#If choose 2, custom val = 1, 1, 1, 1
#===============================================================================================

library(lidR)
library(RCSF)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile, select = "xyzrn")


#Default or Custom Val Param (choose one)

option = readline(prompt = "Enter [1] for default val param or [2] for custom val param: ")

sloopSmooth <- F

if (option == 1){
  
  #Implement CSF algorithm with default val param
  
  las <- classify_ground(las, algorithm = csf())
  
}else if (option ==2){
  
  sloopSmoothOpt = readline(prompt = "Enter [1] to enable sloop smooth or [2] to disable: ")
  
  if (sloopSmoothOpt == 1){
    
    sloopSmooth <- T
    
  }else if (sloopSmoothOpt == 2){
    
    sloopSmooth <- F
    
  }
  
  classThreshold = readline(prompt = "Enter the class threshold: ")
  
  classThreshold = as.integer(classThreshold)
  
  clothResolution = readline(prompt = "Enter the cloth resolution: ")
  
  clothResolution = as.integer(clothResolution)
  
  timeStep = readline(prompt = "Enter the time step: ")
  
  timeStep = as.integer(timeStep)
  
  
  #Rebuild CSF algorithm with custom val param
  
  cusCSF <- csf(sloop_smooth = sloopSmooth, class_threshold = classThreshold, cloth_resolution = clothResolution, time_step = timeStep)
  
  las <- classify_ground(las, cusCSF)
  
  
}else{
  
  print("Err")
  
}


#Plot Result (3D view)

plot(las, color = "Classification", size = 2, bg = "white") 
