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

## Get Subset of Data
sub_data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

## Create the Histogram
png(filename="plot2.png", width=480, height=480)
plot(sub_data$Date_Time, sub_data$Global_active_power
     , ylab="Global Active Power (kilowatts)"
     , type="l"
     , xlab="")
dev.off()

