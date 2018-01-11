BoatsTrajectories <- function (dataset){
  
 dt = dataset
 dt$Latitude = as.double(dt$Latitude)
 dt$Longitude = as.double(dt$Longitude)
  
 UniqueBoatPosition =  dt[!duplicated(dt$sourceMmsi),]
 UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F] 

  for (i in 1:(nrow(UniqueBoatID))){
   cbind(UniqueBoatID,shipTrajectory(sourceMmsi[i],dt))
    
  }

}