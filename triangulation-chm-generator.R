#DEMO GUIDE
#Without max edge = 0.5, 2
#With max edge = 0.5, 1, 8
#=====================================================================

library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


# Prompt grid res for CHM

gridRes = readline(prompt = "Enter grid resolution (m): ")

gridRes = as.double(gridRes)


# Prompt for triangle max edge define

option = readline(prompt = "Define triangle max edge? [1] for Yes/ [2] for No: ")

if (option == 1){
  
  edgeLength = readline(prompt = "Enter the length of the triangle length: ")
  
  chm <- rasterize_canopy(las, res = gridRes, algorithm = dsmtin(max_edge = edgeLength))
  
}else if (option == 2){
  
  chm <- rasterize_canopy(las, res = gridRes, algorithm = dsmtin())

}else{
  
  print("Err")
  
}


#Plot Result (plot)

plot(chm, col = col)


