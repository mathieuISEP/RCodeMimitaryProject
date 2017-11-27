shipTrajectory <- function (shipId,dataset){
  
  x <- shipId
 #dataset <- read.csv(dataFile,sep=",", header=TRUE)
  dt = dataset
    dt$Latitude = as.double(dt$Latitude)
    dt$Longitude = as.double(dt$Longitude)
    
    boatPosition = dt[which(dt$sourceMmsi == x),]
    attach(boatPosition)
    
    #i=1
    for (i in length(boatPosition)-1){
      lat1 = boatPosition$Latitude[i]
      long1 = boatPosition$Longitude[i]
      lat2 = boatPosition$Latitude[i+1]
      long2 = boatPosition$Longitude[i+1]
      print(earthDist(lat1,long1,lat2,long2))
      i= i+1
    }
    
}