#NO DEMO GUIDE FOR THIS PROGRAM
#USER CAN CHOOSE USING DIFFERENT CALC METHOD, GRID RES, SUB-C TWEAK, & POST-PROCESSING

library(lidR)
library(terra)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


# Point-to-raster 2 resolutions

chm_p2r_05 <- rasterize_canopy(las, 0.5, p2r(subcircle = 0.2), pkg = "terra")

chm_p2r_1 <- rasterize_canopy(las, 1, p2r(subcircle = 0.2), pkg = "terra")


# Pitfree with and without subcircle tweak

chm_pitfree_05_1 <- rasterize_canopy(las, 0.5, pitfree(), pkg = "terra")

chm_pitfree_05_2 <- rasterize_canopy(las, 0.5, pitfree(subcircle = 0.2), pkg = "terra")


# Post-processing median filter

kernel <- matrix(1,3,3)

chm_p2r_05_smoothed <- terra::focal(chm_p2r_05, w = kernel, fun = median, na.rm = TRUE)

chm_p2r_1_smoothed <- terra::focal(chm_p2r_1, w = kernel, fun = median, na.rm = TRUE)


#locate the tree tops

ttops_chm_p2r_05 <- locate_trees(chm_p2r_05, lmf(5))

ttops_chm_p2r_1 <- locate_trees(chm_p2r_1, lmf(5))
ttops_chm_pitfree_05_1 <- locate_trees(chm_pitfree_05_1, lmf(5))

ttops_chm_pitfree_05_2 <- locate_trees(chm_pitfree_05_2, lmf(5))

ttops_chm_p2r_05_smoothed <- locate_trees(chm_p2r_05_smoothed, lmf(5))

ttops_chm_p2r_1_smoothed <- locate_trees(chm_p2r_1_smoothed, lmf(5))


#Plot Result (Plot)

#par(mfrow=c(3,2)) #<-REMOVE COMMENT TO TEST RESULT

col <- height.colors(50)

plot(chm_p2r_05, main = "Tree tops detection using CHM with point to raster calculation (0.5 grid res)", col = col); plot(sf::st_geometry(ttops_chm_p2r_05), add = T, pch =3)

#===============REMOVE COMMENT TO TEST RESULT================================
#plot(chm_p2r_1, main = "CHM P2R 1", col = col); plot(sf::st_geometry(ttops_chm_p2r_1), add = T, pch = 3)
#plot(chm_p2r_05_smoothed, main = "CHM P2R 0.5 smoothed", col = col); plot(sf::st_geometry(ttops_chm_p2r_05_smoothed), add = T, pch =3)
#plot(chm_p2r_1_smoothed, main = "CHM P2R 1 smoothed", col = col); plot(sf::st_geometry(ttops_chm_p2r_1_smoothed), add = T, pch =3)
#plot(chm_pitfree_05_1, main = "CHM PITFREE 1", col = col); plot(sf::st_geometry(ttops_chm_pitfree_05_1), add = T, pch =3)
#plot(chm_pitfree_05_2, main = "CHM PITFREE 2", col = col); plot(sf::st_geometry(ttops_chm_pitfree_05_2), add = T, pch =3)

