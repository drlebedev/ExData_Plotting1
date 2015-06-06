if(!exists("loaddata", mode="function")) source("load.R")

plot2 <- function(data = loaddata()) {
 
  data$Datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  png("plot2.png")
  plot(data$Datetime, 
       data$Global_active_power, 
       ylab="Global Active Power", 
       xlab="", 
       type="l")
  dev.off()
  
}