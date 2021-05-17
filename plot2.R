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

#plot figure 2
png(file = "plot2.png")

plot(subdata$datetime, subdata$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
