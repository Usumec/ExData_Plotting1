# read data
library(dplyr)
data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = T,
                   na.strings = "?")

#select data to use
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#convert date formats
subdata <- mutate(subdata, datetime = paste(Date, Time))
subdata$datetime <- strptime(subdata$datetime, "%d/%m/%Y %T")

#plot figure 4
png(file = "plot4.png")

par(mfrow = c(2,2))

plot(subdata$datetime, subdata$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power")

plot(subdata$datetime, subdata$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(subdata$datetime, subdata$Sub_metering_1,
     type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_1)
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")
legend("topright", bty= "n", lty = 1, 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))

with(subdata, plot(datetime, Global_reactive_power,
     type = "l"))

dev.off()

