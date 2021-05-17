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

# plot figure 1
png(file = "plot1.png")
hist(subdata$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
