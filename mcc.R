#DEMO GUIDE
#Scale Parameter = 1.5
#Curvature Threshold = 0.3
#================================================================================

library(lidR)
library(RMCC)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile, select = "xyzrn")


#Prompt for param: scale parameter

scaleParameter = readline(prompt = "Enter scale parameter: ")

scaleParameter = as.double(scaleParameter)


#Prompt for param: curvature threshold

curvatureThreshold = readline(prompt = "Enter curvature threshold: ")

curvatureThreshold = as.double(curvatureThreshold)


#Implement MCC algorithm

las <- classify_ground(las, mcc(s=scaleParameter, t=curvatureThreshold))


#Plot Result (3D view)

plot(las, color = "Classification", size = 2, bg = "white")  
