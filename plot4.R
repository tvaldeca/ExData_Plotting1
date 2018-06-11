library(dplyr)

setwd("~/data")

expdata <- filter(subset(read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", blank.lines.skip = TRUE),
                         Date == "1/2/2007" | Date == "2/2/2007"), !is.na(Sub_metering_3))

par(mfrow = c(2,2))
with(expdata, {
  plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
       type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", ylim = c(0,7.5))
  
  plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage,
       type = "l", ylab = "Voltage", xlab = "datetime", ylim = c(233, 247))
  
  plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
       type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,38))
  points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col = "red")
  points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, cex = 0.75, y.intersp = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power,
       type = "l", ylab = "Global_reactive_power", xlab = "datetime", ylim = c(0,0.5))
})

dev.copy(png, file = "plot4.png")
dev.off()