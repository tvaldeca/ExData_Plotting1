library(dplyr)

setwd("~/data")

expdata <- filter(subset(read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", blank.lines.skip = TRUE),
                         Date == "1/2/2007" | Date == "2/2/2007"), !is.na(Sub_metering_3))

with(expdata, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
                   type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", ylim = c(0,7.5)))

dev.copy(png, file = "plot2.png")
dev.off()