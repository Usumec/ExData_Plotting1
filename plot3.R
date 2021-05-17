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

#plot figure 3
png(file = "plot3.png")

plot(subdata$datetime, subdata$Sub_metering_1,
     type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_1)
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()

