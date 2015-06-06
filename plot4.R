# Plot 4

# Read in data from household_power_consumption.txt file
info <- read.table("household_power_consumption.txt", header=T, sep=";")
info$Date <- as.Date(info$Date, format="%d/%m/%Y")

#Subset of data from specific timeframe
data <- info[(info$Date=="2007-02-01") | (info$Date=="2007-02-02"),]
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# create plot and save to plot4.png
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))

# plot topleft
plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# plot topright
plot(data$timestamp,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot bottomleft
plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp,data$Sub_metering_2,col="red")
lines(data$timestamp,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1)) 

#plot bottomright
plot(data$timestamp,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()