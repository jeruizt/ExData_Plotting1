originefile= file("household_power_consumption.txt")
nomcol=unlist(strsplit(grep("[A-Z]", readLines(originefile), value = TRUE),split=";"))
mydata=read.table(text=grep("^[1,2]/2/2007", readLines(originefile), value = TRUE), col.names =nomcol , sep = ";", header = TRUE)
mydata$Datewt=as.POSIXct(paste(as.Date(mydata$Date),mydata$Time))

png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(mydata, {
  plot(Global_active_power ~ Datewt, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datewt, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datewt, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datewt, col = 'Red')
  lines(Sub_metering_3 ~ Datewt, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = nomcol[7:9])
  plot(Global_reactive_power ~ Datewt, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()
