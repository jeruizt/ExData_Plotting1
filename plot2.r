
originefile= file("household_power_consumption.txt")
nomcol=unlist(strsplit(grep("[A-Z]", readLines(originefile), value = TRUE),split=";"))
mydata=read.table(text=grep("^[1,2]/2/2007", readLines(originefile), value = TRUE), col.names =nomcol , sep = ";", header = TRUE)
mydata$Datewt=as.POSIXct(paste(as.Date(mydata$Date),mydata$Time))

png(file = "plot2.png")
plot(mydata$Global_active_power~mydata$Datewt,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
