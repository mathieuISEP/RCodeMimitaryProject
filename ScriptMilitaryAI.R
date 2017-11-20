#set your working directory
#output=read.csv("output.txt", sep=",", header=FALSE)

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

#Tri par type
attach(output)
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
output1$V2=gsub("^.*?=","", output1$V2)
output1$V3=gsub("^.*?=","", output1$V3)
output1$V4=gsub("^.*?=","", output1$V4)
output1$V5=gsub("^.*?=","", output1$V5)
output1$V6=gsub("^.*?=","", output1$V6)
output1$V7=gsub("^.*?=","", output1$V7)
output1$V8=gsub("^.*?=","", output1$V8)
output1$V9=gsub("^.*?=","", output1$V9)
output1$V10=gsub("^.*?=","", output1$V10)
output1$V11=gsub("^.*?=","", output1$V11)
output1$V12=gsub("^.*?=","", output1$V12)
output1$V20=gsub("^.*?=","", output1$V20)
output1$V21=gsub("^.*?=","", output1$V21)
output1$V22=gsub("^.*?=","", output1$V22)
output1$V23=gsub("[[:punct:][:lower:][:upper:]]","", output1$V23)
colnames(output1) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
output1 = output1[,-c(21,22,25:39)]

# pour les messages de type 2
output2$V2=gsub("^.*?=","", output2$V2)
output2$V3=gsub("^.*?=","", output2$V3)
output2$V4=gsub("^.*?=","", output2$V4)
output2$V5=gsub("^.*?=","", output2$V5)
output2$V6=gsub("^.*?=","", output2$V6)
output2$V7=gsub("^.*?=","", output2$V7)
output2$V8=gsub("^.*?=","", output2$V8)
output2$V9=gsub("^.*?=","", output2$V9)
output2$V10=gsub("^.*?=","", output2$V10)
output2$V11=gsub("^.*?=","", output2$V11)
output2$V12=gsub("^.*?=","", output2$V12)
output2$V20=gsub("^.*?=","", output2$V20)
output2$V21=gsub("^.*?=","", output2$V21)
output2$V22=gsub("^.*?=","", output2$V22)
output2$V23=gsub("[[:punct:][:lower:][:upper:]]","", output2$V23)
colnames(output2) <- c("NumberTypeMessage","MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
output2 = output2[,-c(21,22,25:39)]

# pour les messages de type 3
output3$V2=gsub("^.*?=","", output3$V2)
output3$V3=gsub("^.*?=","", output3$V3)
output3$V4=gsub("^.*?=","", output3$V4)
output3$V5=gsub("^.*?=","", output3$V5)
output3$V6=gsub("^.*?=","", output3$V6)
output3$V7=gsub("^.*?=","", output3$V7)
output3$V8=gsub("^.*?=","", output3$V8)
output3$V9=gsub("^.*?=","", output3$V9)
output3$V10=gsub("^.*?=","", output3$V10)
output3$V11=gsub("^.*?=","", output3$V11)
output3$V12=gsub("^.*?=","", output3$V12)
output3$V13=gsub("^.*?=","", output3$V13)
output3$V14=gsub("^.*?=","", output3$V14)
output3$V15=gsub("^.*?=","", output3$V15)
output3$V16=gsub("^.*?=","", output3$V16)
output3$V17=gsub("^.*?=","", output3$V17)
output3$V18=gsub("^.*?=","", output3$V18)
output3$V19=gsub("^.*?=","", output3$V19)
output3$V20=gsub("^.*?=","", output3$V20)
output3$V21=gsub("^.*?=","", output3$V27)
output3$V22=gsub("^.*?=","", output3$V28)
output3$V11=gsub("^.*?=","", output3$V29)
output3$V12=gsub("^.*?=","", output3$V30)
colnames(output3) <- c("NumberTypeMessage","MessageType", "RegionalReserved1", "SpeedOverGround", "PositionAccurate", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Second", "RegionalReserved2", "CsUnit", "display", "dsc", "band", "message22", "assigned", "raimFlag", "commStateSelectorFlag", "commState", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB","Data","Data1","Metadata", "Received","repeatIndicator", "sourceMmsi")




#new_DF <- output[rowSums(is.na(output)) > 0,] #A compléter pour numbertypemessage

output$Timestamp=as.numeric(output$Timestamp)
output$sourceMmsi=as.numeric(output$sourceMmsi)


output1$Latitude = as.numeric(output1$Latitude)
output1$Longitude = as.numeric(output1$Longitude)

attach(output1)

a = output1[which(output1$sourceMmsi == 227006760),]

a = a[order(a$Timestamp),]

#Calculate Distance from  Latitude and Longitude
library(geosphere)
pos1 = (c(Latitude[7],Longitude[7]))
pos2 = (c(Latitude[8],Longitude[8]))
earthDist(Latitude[7],Longitude[7],Latitude[8],Longitude[8])

shipTrajectory(227006760,output1)
