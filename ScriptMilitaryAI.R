#set your working directory

#chargement du fichier
output=read.csv("outputtry.txt", sep=",", header=FALSE)

#création de la colonne NumberTypeMessage
output["NumberTypeMessage"]<- NA

#Nomenclature des différents types de messages
output$`NumberTypeMessage`[output$V1=="PositionReportClassAScheduled{messageType=PositionReportClassAScheduled}"]=1
output$`NumberTypeMessage`[output$V1=="PositionReportClassAResponseToInterrogation{messageType=PositionReportClassAResponseToInterrogation}"]=2
output$`NumberTypeMessage`[output$V1=="StandardClassBCSPositionReport{messageType=StandardClassBCSPositionReport"]=3
output$`NumberTypeMessage`[output$V1=="ShipAndVoyageData{messageType=ShipAndVoyageRelatedData"]=4
output$`NumberTypeMessage`[output$V1=="BaseStationReport{messageType=BaseStationReport"]=5
output$`NumberTypeMessage`[output$V1=="PositionReportClassAAssignedSchedule{messageType=PositionReportClassAAssignedSchedule}"]=6
output$`NumberTypeMessage`[output$V1=="AidToNavigationReport{messageType=AidToNavigationReport"]=7
output$`NumberTypeMessage`[output$V1=="ExtendedClassBEquipmentPositionReport{messageType=ExtendedClassBEquipmentPositionReport"]=8
output$`NumberTypeMessage`[output$V1=="DataLinkManagement{messageType=DataLinkManagement"]=9
output$`NumberTypeMessage`[output$V1=="BinaryBroadcastMessage{messageType=BinaryBroadcastMessage"]=10
output$`NumberTypeMessage`[output$V1=="GNSSBinaryBroadcastMessage{messageType=GNSSBinaryBroadcastMessage"]=11
output$`NumberTypeMessage`[output$V1=="AddressedBinaryMessage{messageType=AddressedBinaryMessage"]=12
output$`NumberTypeMessage`[output$V1=="UTCAndDateInquiry{messageType=UTCAndDateInquiry"]=13
output$`NumberTypeMessage`[output$V1=="StandardSARAircraftPositionReport{messageType=StandardSARAircraftPositionReport"]=14
output$`NumberTypeMessage`[output$V1=="StandardSARAircraftPositionReport{messageType=StandardSARAircraftPositionReport"]=15
output$`NumberTypeMessage`[output$V1=="ClassBCSStaticDataReport{messageType=ClassBCSStaticDataReport"]=16
output$`NumberTypeMessage`[output$V1=="ChannelManagement{messageType=ChannelManagement"]=17
output$`NumberTypeMessage`[output$V1=="UTCAndDateResponse{messageType=UTCAndDateResponse"]=18
output$`NumberTypeMessage`[output$V1=="ChannelManagement{messageType=ChannelManagement"]=19
output$`NumberTypeMessage`[output$V1=="ChannelManagement{messageType=ChannelManagement"]=20
output$`NumberTypeMessage`[output$V1=="ChannelManagement{messageType=ChannelManagement"]=21
output <- output[,c(39,1:38)]
attach(output)

#Tri par type
output1 = output[which(NumberTypeMessage == 1),]
output2 = output[which(NumberTypeMessage == 2),]
output3 = output[which(NumberTypeMessage == 3),]
output4 = output[which(NumberTypeMessage == 4),]
output5 = output[which(NumberTypeMessage == 5),]
output6 = output[which(NumberTypeMessage == 6),]
output7 = output[which(NumberTypeMessage == 7),]
output8 = output[which(NumberTypeMessage == 8),]


#traitement des colonnes par type de message
# pour les messages de type 1
#suprression des éléments inutiles dans les colonnes 
for (i in c(2:12,20:23)) {
  output1[,i]=gsub("^.*?=","", output1[,i])
}
output1$V23=gsub("[[:punct:][:lower:][:upper:]]","", output1$V23)
#nomenclature des colonnes
colnames(output1) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#supression des colonnes inutiles
output1 = output1[,-c(21,22,25:39)]

# pour les messages de type 2
#suprression des éléments inutiles dans les colonnes
for (i in c(2:12,20:23)) {
  output2[,i]=gsub("^.*?=","", output2[,i])
}
output2$V23=gsub("[[:punct:][:lower:][:upper:]]","", output2$V23)
#nomenclature des colonnes
colnames(output2) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#supression des colonnes inutiles
output2 = output2[,-c(21,22,25:39)]

# pour les messages de type 3
#suprression des éléments inutiles dans les colonnes 
for (i in c(2:20,27:30)) {
    output3[,i]=gsub("^.*?=","", output3[,i])
}
output3$V30=gsub("[[:punct:][:lower:][:upper:]]","", output3$V30)
#nomenclature des colonnes
colnames(output3) <- c("NumberTypeMessage","MessageType", "RegionalReserved1", "SpeedOverGround", "PositionAccurate", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Second", "RegionalReserved2", "CsUnit", "display", "dsc", "band", "message22", "assigned", "raimFlag", "commStateSelectorFlag", "commState", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1","Metadata", "Received","repeatIndicator", "sourceMmsi")
#supression des colonnes inutiles
output3 = output3[,-c(28,29,32:39)]

# pour les messages de type 4
#suprression des éléments inutiles dans les colonnes
for (i in c(2:15,29:32)) {
  output4[,i]=gsub("^.*?=","", output4[,i])
}
output4$V32=gsub("[[:punct:][:lower:][:upper:]]","", output4$V32)
#nomenclature des colonnes
colnames(output4) <- c("NumberTypeMessage","MessageType", "imo", "callsign", "shipname", "shipType","toBow","toStern","toStarboard","toPort","positionFixingDevice","eta","draught","destination","dataTerminalReady","AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1","NMEAMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#supression des colonnes inutiles
output4 = output4[,-c(30,31,34:39)]


#new_DF <- output[rowSums(is.na(output)) > 0,] #A compléter pour numbertypemessage

#changement de type des variables (string à numérique)
output1$Timestamp=as.numeric(output1$Timestamp)
output1$sourceMmsi=as.numeric(output1$sourceMmsi)
output1$Latitude = as.numeric(output1$Latitude)
output1$Longitude = as.numeric(output1$Longitude)

attach(output1)


library(fpc)
DBSCAN = dbscan(cbind(lat, lon), eps = 10, MinPts = 3)
plot(lon, lat, col = DBSCAN$cluster, pch = 20)

for (i in 1:5){
km.out= kmeans(cbind(lat, lon),i,nstart = 20)
plot(km.out)
}


#install.packages("rworldmap")
#install.packages("rworldxtra")
#library(rworldmap)
#library(rworldxtra)
bb = qbbox(lat = a$Latitude,lon = a$Longitude)
map = GetMap.bbox(bb$lonR,bb$latR,destfile = "cartographie.png",maptype="hybrid")
PlotOnStaticMap(map,lat=a$Latitude,lon = a$Longitude,destfile = "cartographie.png",cex=2,pch=20)

newmap <- getMap(resolution = "high")

plot(newmap,xlim = c(-180,180), ylim = c(-180,180), asp = 1)
lat = output2$Latitude
lon = output2$Longitude
table = cbind(lat,lon)

#K-means
#library(clusterSim)

for (i in 2:10){
  km.out = kmeans(table,i,nstart = 20)
  #k = c('K-Means Clustering Results with K=',i)
  plot(newmap,xlim = c(-180,180), ylim = c(-180,180), asp = 1)
  points(lon,lat,col=(km.out$cluster+1), pch=20,cex=2)
  print(index.DB(table,km.out$cluster)$DB)
  invisible(readline(prompt="Press [enter] to continue"))
}

#DBSCAN 
DBSCAN = dbscan(table, eps = 10, MinPts = 3)
points(lon,lat,col=DBSCAN$cluster,cex=1,pch=20)

plot(newmap,xlim = c(0, 1), ylim = c(48, 50), asp = 1)
points(a$Longitude,a$Latitude,col="red",cex=1,pch=20)


#BoatsTrajectories draft (column works, trying by row)
UniqueBoatPosition =  output1[!duplicated(output1$sourceMmsi),]
UniqueBoatID <- UniqueBoatPosition[,c(22),drop = F]

qqq=BoatsTrajectories(output1)
qqqq=BoatsTrajectoriesrow(output1)

abb=t(shipTrajectory(227006760,output1))

UniqueBoatIdrowtry = rbind(UniqueBoatIDrow[1,],t(shipTrajectory(UniqueBoatID$sourceMmsi[1],output1)))
shipTrajectory(UniqueBoatID$sourceMmsi[1],output1)

UniqueBoatIdColumnedtry = rbind(UniqueBoatIdColumned[,2],shipTrajectory(UniqueBoatID$sourceMmsi[2],output1))
as.data.frame(UniqueBoatIdColumnedtry)

# for (i in 1:5){
#  tes=UniqueBoatIdColumned[,i]
#   i <- i + 1
#   print(tes)
# }
# 
# for (i in 1:5){
#   
#   UniqueBoatIdColumnedtest = rbind(UniqueBoatIdColumned[,i],shipTrajectory(UniqueBoatID$sourceMmsi[i],dt))
#  i <- i + 1
#  print(UniqueBoatIdColumnedtest)
# }
# for (i in 1:5){
#   
#   Allboatstrajectoriesloop = rbind(UniqueBoatIdColumned[,i],shipTrajectory(UniqueBoatID$sourceMmsi[i],dt))
#   Allboatstrajectories = c(Allboatstrajectories,Allboatstrajectoriesloop)
#   i <- i + 1
# }