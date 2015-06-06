if(!exists("loaddata", mode="function")) source("load.R")

plot3 <- function(data = loaddata()) {
 
  data$Datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  png("plot3.png")
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
         lwd="1", lty = c(1,1,1))
  dev.off()
  
}