#DEMO GUIDE
#resolution = 1
#==================================================================

library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


#Prompt grid res for DTM 

res = readline(prompt = "Enter grid resolution (m): ")

res = as.integer(res)


#Generate DTM

dtm <- rasterize_terrain(las, res, knnidw())

nlas <- las - dtm


#Plot Result (3D view)

plot(nlas, size = 2, bg = "white")

