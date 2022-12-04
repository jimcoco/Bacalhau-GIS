library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


#Implement height normalization with point cloud

nlas <- normalize_height(las, knnidw())


#Plot Result (3D view)

plot(nlas, size = 2, bg = "white")
