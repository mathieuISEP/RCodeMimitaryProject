shipTrajectory <- function (shipId,dataFile){
  
  x <- shipId
  dataset <- read.csv("dataFile",sep=",", header=TRUE)
  attach(dataset)
  if (sourceMmsi == x){
    boat.position <- dataset[which(dataset$sourceMmsi == x)]
    boat.position = boat.position[order(boat.position$Timestamp),]
    
    for (i in length(boat.position-1)){
      lat1 = boat.position$Latitude[i]
      long1 = boat.position$Longitude[i]
      lat2 = boat.position$Latitude[i+1]
      long2 = boat.position$Longitude[i+1]
      return(earthDist(lat1,long1,lat2,long2))
    }
    
  }
  
}