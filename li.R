#NO DEMO FOR THIS PROGRAM
#USER ABLE TO USE CUSTOM VALS FOR THE ALGO'S PARAM

library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


#Implement Li 2012 algo

algo <- li2012() #using all the default vals

las <- segment_trees(las, algo)


#Plot Result (3D View)

plot(las, bg = "white", size = 2, color = "treeID") 