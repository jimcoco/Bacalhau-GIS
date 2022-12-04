#NO DEMO FOR THIS PROGRAM

library(lidR)
library(terra)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


#Point-to-raster 2 resolutions

chm_p2r_05 <- rasterize_canopy(las, 0.5, p2r(subcircle = 0.2), pkg = "terra") #Choose for demo purpose


#Smooth CHM

kernel <- matrix(1,3,3)

chm_p2r_05_smoothed <- terra::focal(chm_p2r_1, w = kernel, fun = mean, na.rm = TRUE)


#Plot Result (plot)

plot(chm_p2r_05_smoothed, col = col)