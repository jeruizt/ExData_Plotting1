
originefile= file("household_power_consumption.txt")
nomcol=unlist(strsplit(grep("[A-Z]", readLines(originefile), value = TRUE),split=";"))
mydata=read.table(text=grep("^[1,2]/2/2007", readLines(originefile), value = TRUE), col.names =nomcol , sep = ";", header = TRUE)
mydata$Datewt=as.POSIXct(paste(as.Date(mydata$Date),mydata$Time))

png(file = "plot3.png")
with(mydata, {
  plot(Sub_metering_1 ~ Datewt, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datewt, col = 'Red')
  lines(Sub_metering_3 ~ Datewt, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = nomcol[7:9])
dev.off()
