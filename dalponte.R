#NO DEMO FOR THIS PROGRAM
#USER ABLE TO CHOOSE THE POST-PROCESSED CHM & CHM WHICH HAD LOCATED THE TREE TOPS

library(lidR)
library(terra)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


# Point-to-raster 2 resolutions

chm_p2r_05 <- rasterize_canopy(las, 0.5, p2r(subcircle = 0.2), pkg = "terra") #Choose for demo purpose


# Post-processing median filter

kernel <- matrix(1,3,3)

chm_p2r_05_smoothed <- terra::focal(chm_p2r_05, w = kernel, fun = median, na.rm = TRUE) #Choose of demo purpose


#Locate the tree tops

ttops_chm_p2r_05_smoothed <- locate_trees(chm_p2r_05_smoothed, lmf(5))


#Implement dalponte algorithm

algo <- dalponte2016(chm_p2r_05_smoothed, ttops_chm_p2r_05_smoothed)

las <- segment_trees(las, algo)


#Plot Result (3D View)

plot(las, bg = "white", size = 2, color = "treeID") 