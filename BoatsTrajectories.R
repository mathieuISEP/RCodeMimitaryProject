BoatsTrajectories <- function (dataset){
  
 dt = dataset
 dt$Latitude = as.double(dt$Latitude)
 dt$Longitude = as.double(dt$Longitude)
  
 UniqueBoatPosition =  dt[!duplicated(dt$sourceMmsi),,drop=F]
 UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F] 
 UniqueBoatIdColumned <- as.data.frame(t(UniqueBoatID))

  for (i in 1:(length(UniqueBoatIdColumned))){
    
    UniqueBoatIdColumned = append(UniqueBoatIdColumned,shipTrajectory(UniqueBoatID$sourceMmsi[i],dt))
    i <- i + 1
   }
return(as.data.frame(UniqueBoatIdColumned))
}