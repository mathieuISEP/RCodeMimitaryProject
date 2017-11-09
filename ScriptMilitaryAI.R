#set your working directory
output=read.csv("output.txt", sep=",", header=FALSE) #C'est outputtest, le petit sample de output dispo sur discord
output["NumberTypeMessage"]<- NA
output$`NumberTypeMessage`[output$V1=="PositionReportClassAScheduled{messageType=PositionReportClassAScheduled}"]=1
output$`NumberTypeMessage`[output$V1=="PositionReportClassAResponseToInterrogation{messageType=PositionReportClassAResponseToInterrogation}"]=2
output$`NumberTypeMessage`[output$V1=="StandardClassBCSPositionReport{messageType=StandardClassBCSPositionReport"]=3
output$`NumberTypeMessage`[output$V1=="ShipAndVoyageData{messageType=ShipAndVoyageRelatedData"]=4
output$V2=gsub("^.*?=","", output$V2)
output$V3=gsub("^.*?=","", output$V3)
output$V4=gsub("^.*?=","", output$V4)
output$V5=gsub("^.*?=","", output$V5)
output$V6=gsub("^.*?=","", output$V6)
output$V7=gsub("^.*?=","", output$V7)
output$V8=gsub("^.*?=","", output$V8)
output$V9=gsub("^.*?=","", output$V9)
output$V10=gsub("^.*?=","", output$V10)
output$V11=gsub("^.*?=","", output$V11)
output$V12=gsub("^.*?=","", output$V12)
output$V20=gsub("^.*?=","", output$V20)
output$V21=gsub("^.*?=","", output$V21)
output$V22=gsub("^.*?=","", output$V22)
output$V23=gsub("[[:punct:][:lower:][:upper:]]","", output$V23)
colnames(output) <- c("MessageType", "NavigationStatus", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "AISMessage", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi","NumberTypeMessage")
output <- output[,c(24,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)]
attach(output)
output1 = output[which(NumberTypeMessage == 1),]
output2 = output[which(NumberTypeMessage == 2),]


#Calculate Distance from  Latitude and Longitude
library(geosphere)
pos1 = as.numeric(c(Latitude[1],Longitude[1]))
pos2 = as.numeric(c(Latitude[2],Longitude[2]))
distm (pos1,pos2, fun = distHaversine)


