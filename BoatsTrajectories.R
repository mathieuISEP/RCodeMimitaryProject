BoatsTrajectories <- function (dataset){
  
  dt = dataset
  dt$Latitude = as.double(dt$Latitude)
  dt$Longitude = as.double(dt$Longitude)
  
  UniqueBoatPosition =  dt[!duplicated(dt$sourceMmsi)]
  attach(UniqueBoatPosition)
  
  for (i in 1:(length(UniqueBoatPosition)-1)){
   shipTrajectory(UniqueBoatPosition)
    
  }
  #return(earthDist(lat1,long1,lat2,long2))
  
}