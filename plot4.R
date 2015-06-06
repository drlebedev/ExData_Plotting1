if(!exists("loaddata", mode="function")) source("load.R")

plot4 <- function(data = loaddata()) {

  data$Datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  png("plot4.png")
  par(mfrow = c(2, 2))
  plot(data$Datetime, 
       data$Global_active_power, 
       ylab="Global Active Power", 
       xlab="", 
       type="l")
  plot(data$Datetime, 
       data$Voltage, 
       ylab="Voltage", 
       xlab="datetime", 
       type="l")
  plot(data$Datetime, 
       data$Sub_metering_1, 
       ylab="Energy sub metering", 
       xlab="",
       type="l")
  lines(data$Datetime, 
        data$Sub_metering_2,
        col = "red")
  lines(data$Datetime, 
        data$Sub_metering_3,
        col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lwd="1", lty = c(1,1,1), bty = "n")
  plot(data$Datetime, 
       data$Global_reactive_power, 
       ylab="Global Reactive Power", 
       xlab="datetime", 
       type="l")
  dev.off()
  
}