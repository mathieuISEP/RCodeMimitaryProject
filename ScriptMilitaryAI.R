#set your working directory
output=read.csv("outputtest.txt", sep=",", header=FALSE) #C'est outputtest, le petit sample de output dispo sur discord
output["Message type"]<- NA
output$`Message type`[output$V1=="PositionReportClassAScheduled{messageType=PositionReportClassAScheduled}"]=1
output$`Message type`[output$V1=="PositionReportClassAResponseToInterrogation{messageType=PositionReportClassAResponseToInterrogation}"]=2
output$`Message type`[output$V1=="StandardClassBCSPositionReport{messageType=StandardClassBCSPositionReport"]=3
output$`Message type`[output$V1=="ShipAndVoyageData{messageType=ShipAndVoyageRelatedData"]=4
colnames(output) <- c("MessageType", "RateOfTurn", "SpeedOverGround", "PositionAccuracy", "Latitude", "Longitude", "CourseOverGround", "TrueHeading", "Timestamp", "specialManeuverIndicator", "raimFlag", "SyncState", "SlotTime-out", "Undefined", "AB", "Data", "Data1", "Metadata", "Received", "repeatIndicator", "sourceMmsi")
output$V2=gsub("^.*?=","", output$V2)
output$V3=gsub("^.*?=","", output$V3)
output$V4=gsub("^.*?=","", output$V4)
output$V2=gsub("^.*?=","", output$V2)
output$V2=gsub("^.*?=","", output$V2)
output$V2=gsub("^.*?=","", output$V2)
output$V2=gsub("^.*?=","", output$V2)
output$V2=gsub("^.*?=","", output$V2)
#output <- output[,c(22,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)]
View(output)