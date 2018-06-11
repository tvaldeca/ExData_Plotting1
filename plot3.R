library(dplyr)

setwd("~/data")

expdata <- filter(subset(read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", blank.lines.skip = TRUE),
                         Date == "1/2/2007" | Date == "2/2/2007"), !is.na(Sub_metering_3))

with(expdata, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
                   type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,38)))
with(expdata, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col = "red"))
with(expdata, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()