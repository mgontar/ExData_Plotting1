## Read data from household_power_consumption.txt file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert Date columnt from character to Date
data[,"Date"]<-as.Date(data[,"Date"], format = "%d/%m/%Y")

## Subset data only for 2007-02-01 and 2007-02-02
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Combine Date and Time columns into DateTime column and convert in into POSIXct
data[,"DateTime"] <- as.POSIXct(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

## Create time series plot of 3 energy sub metering by DateTime with legend
par(mfrow=c(1,1))
plot(data$DateTime, data$Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type="n")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
