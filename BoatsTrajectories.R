BoatsTrajectories <- function (dataset){
  
 dt = dataset
 dt$Latitude = as.double(dt$Latitude)
 dt$Longitude = as.double(dt$Longitude)
 Allboatstrajectories=c()
  
 UniqueBoatPosition =  dt[!duplicated(dt$sourceMmsi),,drop=F]
 UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F] 
 UniqueBoatIdColumned <- as.data.frame(t(UniqueBoatID))
 colnames(UniqueBoatIdColumned)<-(UniqueBoatIdColumned[1,])

  for (i in 1:5){
    
    Allboatstrajectoriesloop = rbind(UniqueBoatIdColumned[,i],shipTrajectory(UniqueBoatID$sourceMmsi[i],dt))
    Allboatstrajectories = c(Allboatstrajectories,Allboatstrajectoriesloop)
    i <- i + 1
   }
return(as.data.frame(Allboatstrajectories))
}
