library(dplyr)

setwd("~/data")

expdata <- filter(subset(read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", blank.lines.skip = TRUE),
                             Date == "1/2/2007" | Date == "2/2/2007"), !is.na(Sub_metering_3))

hist(expdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red", ylim = c(0,1200), freq = TRUE)

dev.copy(png, file = "plot1.png")
dev.off()