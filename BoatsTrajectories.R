BoatsTrajectories <- function (dataset){
  
 dt = dataset
 dt$Latitude = as.double(dt$Latitude)
 dt$Longitude = as.double(dt$Longitude)
  
 UniqueBoatPosition =  dt[!duplicated(dt$sourceMmsi),,drop=F]
 UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F] 
 Traject<- as.data.frame(matrix(0, ncol = nrow(UniqueBoatID), nrow = 20))
 
  
  for (i in 1:(length(Traject))){
    
    Traject = rbind(Traject,shipTrajectory(UniqueBoatID$sourceMmsi[i],dt))
    i <- i + 1
   }
return(data.frame(UniqueBoatID))
}