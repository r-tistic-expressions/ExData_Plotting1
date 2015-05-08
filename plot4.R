## Load Packages and Data
library(data.table)
setwd("~/Documents/R Files/Hopkins - Coursera Data Science/Exploratory Data Analysis")
data <- read.table('household_power_consumption.txt'
                   ,sep=";", header=TRUE)

## Change Factors to Dates
data$Date <- as.Date(data$Date, format ="%d/%m/%Y" )
data$Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Change Factors into Numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

## Get Subset of Data
sub_data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

## Create the Histogram
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot 1
plot(sub_data$Date_Time, sub_data$Global_active_power
     , ylab="Global Active Power (kilowatts)"
     , type="l"
     , xlab="datetime")

## Plot 2
plot(sub_data$Date_Time, sub_data$Voltage
     , ylab="Voltage"
     , type="l"
     , xlab="datetime")

## Plot 3
plot(sub_data$Date_Time, sub_data$Sub_metering_1
     , ylab="Global Active Power (kilowatts)"
     , type="l"
     , xlab="datetime")
lines(sub_data$Date_Time, sub_data$Sub_metering_2, col="red", type="l")
lines(sub_data$Date_Time, sub_data$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Plot 4
plot(sub_data$Date_Time, sub_data$Global_reactive_power
     , ylab="Global Reactive Power (kilowatts)"
     , type="l"
     , xlab="datetime")

dev.off()
