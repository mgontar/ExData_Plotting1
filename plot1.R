## Read data from household_power_consumption.txt file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert Date columnt from character to Date
data[,"Date"]<-as.Date(data[,"Date"], format = "%d/%m/%Y")

## Subset data only for 2007-02-01 and 2007-02-02
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Combine Date and Time columns into DateTime column and convert in into POSIXct
data[,"DateTime"] <- as.POSIXct(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

## Create histogram of Global active power
par(mfrow=c(1,1))
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


