#Set your working directory

#Chargement du fichier
output=read.csv("outputtry.txt", sep=",", header=FALSE)

#Création de la colonne NumberTypeMessage
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


#Traitement des colonnes par type de message
#Pour les messages de type 1
#Suprression des éléments inutiles dans les colonnes 
for (i in c(2:12,20:23)) {
  output1[,i]=gsub("^.*?=","", output1[,i])
}
output1$V23=gsub("[[:punct:][:lower:][:upper:]]","", output1$V23)
#Nomenclature des colonnes
colnames(output1) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#Supression des colonnes inutiles
output1 = output1[,-c(21,22,25:39)]

#Pour les messages de type 2
#Suprression des éléments inutiles dans les colonnes
for (i in c(2:12,20:23)) {
  output2[,i]=gsub("^.*?=","", output2[,i])
}
output2$V23=gsub("[[:punct:][:lower:][:upper:]]","", output2$V23)
#Nomenclature des colonnes
colnames(output2) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#Supression des colonnes inutiles
output2 = output2[,-c(21,22,25:39)]

#Pour les messages de type 3
#Suprression des éléments inutiles dans les colonnes 
for (i in c(2:20,27:30)) {
    output3[,i]=gsub("^.*?=","", output3[,i])
}
output3$V30=gsub("[[:punct:][:lower:][:upper:]]","", output3$V30)
#Nomenclature des colonnes
colnames(output3) <- c("NumberTypeMessage","MessageType", "RegionalReserved1", "SpeedOverGround", "PositionAccurate", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Second", "RegionalReserved2", "CsUnit", "display", "dsc", "band", "message22", "assigned", "raimFlag", "commStateSelectorFlag", "commState", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1","Metadata", "Received","repeatIndicator", "sourceMmsi")
#Supression des colonnes inutiles
output3 = output3[,-c(28,29,32:39)]

#Pour les messages de type 4
#Suprression des éléments inutiles dans les colonnes
for (i in c(2:15,29:32)) {
  output4[,i]=gsub("^.*?=","", output4[,i])
}
output4$V32=gsub("[[:punct:][:lower:][:upper:]]","", output4$V32)
#Nomenclature des colonnes
colnames(output4) <- c("NumberTypeMessage","MessageType", "imo", "callsign", "shipname", "shipType","toBow","toStern","toStarboard","toPort","positionFixingDevice","eta","draught","destination","dataTerminalReady","AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1","NMEAMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
#Supression des colonnes inutiles
output4 = output4[,-c(30,31,34:39)]



#Changement de type des variables (string à numérique)
output1$Timestamp=as.numeric(output1$Timestamp)
output1$sourceMmsi=as.numeric(output1$sourceMmsi)
output1$Latitude = as.numeric(output1$Latitude)
output1$Longitude = as.numeric(output1$Longitude)
output2$Latitude = as.numeric(output2$Latitude)
output2$Longitude = as.numeric(output2$Longitude)
attach(output1)


#Trajectoire de bateau
ExempleBateau=shipTrajectory(227006760,output1)
View(ExempleBateau)
ExempleBateaux=BoatsTrajectories(output1)
print(ExempleBateaux)


#Map creation
library(rworldmap)
library(rworldxtra)
newmap <- getMap(resolution = "high")
plot(newmap,xlim = c(-180,180), ylim = c(-180,180), asp = 1)
lat = output1$Latitude
lon = output1$Longitude
table = cbind(lat,lon)


#K-means
library(clusterSim)

for (i in 2:10){
  km.out = kmeans(table,i,nstart = 20)
  #k = c('K-Means Clustering Results with K=',i)
  plot(newmap,xlim = c(-180,180), ylim = c(-180,180), asp = 1)
  points(lon,lat,col=(km.out$cluster+1), pch=20,cex=2)
  print(index.DB(table,km.out$cluster)$DB)
  invisible(readline(prompt="Press [enter] to continue"))
}

#Let us apply kmeans for k=3 clusters 
kmm = kmeans(table,3,nstart = 50,iter.max = 15)  
kmm

#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 15.
k.max <- 10
data <- table
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 30 )$tot.withinss})
wss
plot(1:k.max, wss,
     main='Elbow Method',
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


#DBSCAN
library(fpc)
lat = output2$Latitude
lon = output2$Longitude
table = cbind(lat,lon)
table = data.frame(table)
table$lat = as.numeric(table$lat)
table$lon = as.numeric(table$lon)
newmap <- getMap(resolution = "high")
DBSCAN = dbscan(table, eps = 25, MinPts = 10)
plot(newmap,xlim = c(0, 1), ylim = c(40, 60), asp = 1)
points(lon,lat,col=DBSCAN$cluster+1,cex=1,pch=20)