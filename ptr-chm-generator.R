#DEMO GUIDE
#without subcircle, without interpolation = 1, 2, 2
#with subcircle, with interpolation = 0.5, 1, 0.20, 1

library(lidR)

#Read LAS file

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

las <- readLAS(LASfile)


# Prompt grid res for CHM

gridRes = readline(prompt = "Enter grid resolution (m): ")

gridRes = as.double(gridRes)


# Prompt for point replacement with subcircle

option1 = readline(prompt = "Replace every point in point cloud with subcircle? [1] for Yes/ [2] for No: ")

if (option1 == 1){ 
  
  radius = readline(prompt = "Enter the radius of your subcircle (m): ")
  
  radius = as.double(radius)
  
}else if (option1 ==2){
  
}else{
  
  print("Err")
  
}


#Prompt for empty pixel interpolation

option2 = readline(prompt = "Process CHM with empty pixel interpolation using triangular irregular network (TIN)? [1] for Yes/ [2] for No: ")

if (option2 == 1){
  
  if (option1 == 1){ #with subcircle, with interpolation
    
    chm <- rasterize_canopy(las, res = gridRes, algorithm = p2r(subcircle = radius, na.fill = tin()))
    
  }else if (option1 == 2){ #without subcircle, with interpolation 
    
    chm <- rasterize_canopy(las, res = gridRes, algorithm = p2r(na.fill = tin()))
    
  }
  
}else if (option2 == 2){
  
  if (option1 == 1){ #with subcircle, without interpolation
    
    chm <- rasterize_canopy(las, res = gridRes, algorithm = p2r(subcircle = radius))
    
  }else if (option1 == 2){ #without subcircle, without interpolation (default)
    
    chm <- rasterize_canopy(las, res = gridRes, algorithm = p2r())
    
  }
  
}


#Plot Result (Plots)

plot(chm, col = col)
