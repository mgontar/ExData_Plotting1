## Read data from household_power_consumption.txt file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert Date columnt from character to Date
data[,"Date"]<-as.Date(data[,"Date"], format = "%d/%m/%Y")

## Subset data only for 2007-02-01 and 2007-02-02
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Combine Date and Time columns into DateTime column and convert in into POSIXct
data[,"DateTime"] <- as.POSIXct(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

## Create set of 4 plots: 3 from the previouse scripts and time series plot of Global reactive power
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, col = "black", xlab = "", ylab = "Global Active Power (kilowatts)", type="s")
plot(data$DateTime, data$Voltage, col = "black", xlab = "dataframe", ylab = "Voltage", type="s")
plot(data$DateTime, data$Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type="n")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex=0.75)
plot(data$DateTime, data$Global_reactive_power, col = "black", xlab = "dataframe", ylab = "Global_reactive_power", type="s")
