BoatsTrajectories <- function (dataset){
  
 dt2 = dataset
 dt2$Latitude = as.double(dt2$Latitude)
 dt2$Longitude = as.double(dt2$Longitude)
 Allboatstrajectories=c()
  
 UniqueBoatPosition =  dt2[!duplicated(dt2$sourceMmsi),,drop=F]
 UniqueBoatID = UniqueBoatPosition[,c("sourceMmsi"),drop = F] 
 UniqueBoatIdColumned <- as.data.frame(t(UniqueBoatID))
 colnames(UniqueBoatIdColumned)<-(UniqueBoatIdColumned[1,])
 UniqueBoatIdColumned<-(UniqueBoatIdColumned[-c(1), ])

  for (i in 1:length(UniqueBoatIdColumned)){
  
    Allboatstrajectoriesloop = rbind(UniqueBoatIdColumned[,i],shipTrajectory(UniqueBoatID$sourceMmsi[i],dt2))
    Allboatstrajectories = c(Allboatstrajectories,Allboatstrajectoriesloop)
    i <- i + 1
  }
 
return(Allboatstrajectories)
}
