## Load Packages and Data
library(data.table)
data <- read.table('household_power_consumption.txt'
                   ,sep=";", header=TRUE)

## Change Factors to Dates
data$Date <- as.Date(data$Date, format ="%d/%m/%Y" )

## Change Factors into Numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Get Subset of Data
sub_data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

## Create the Histogram
png(filename="plot1.png", width=480, height=480)
hist(sub_data$Global_active_power
     , col="red"
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)")
dev.off()