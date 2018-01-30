BoatsTrajectoriesrow <- function (dataset){
  
  dt2 = dataset
  dt2$Latitude = as.double(dt2$Latitude)
  dt2$Longitude = as.double(dt2$Longitude)
  Allboatstrajectories=c()
  
  UniqueBoatPosition =  dt2[!duplicated(dt2$sourceMmsi),,drop=F]
  UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F]
  UniqueBoatIDrow = UniqueBoatID
  rownames(UniqueBoatIDrow)<-(UniqueBoatIDrow[,1])
  UniqueBoatIDrow<-(UniqueBoatIDrow[,-c(1) ])
  
  for (i in 1:5){
    
    Allboatstrajectoriesloop = rbind(UniqueBoatIDrow[i,],t(shipTrajectory(UniqueBoatID$sourceMmsi[i],dt2)))
    Allboatstrajectories = c(Allboatstrajectories,Allboatstrajectoriesloop)
    i <- i + 1
  }
  
  return(as.data.frame(Allboatstrajectories))
}
