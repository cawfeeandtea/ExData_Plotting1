# Plot 3: Energy Sub Metering

# Read in data from household_power_consumption.txt file
info <- read.table("household_power_consumption.txt", header=T, sep=";")
info$Date <- as.Date(info$Date, format="%d/%m/%Y")

#Subset of data from specific timeframe
data <- info[(info$Date=="2007-02-01") | (info$Date=="2007-02-02"),]
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Create and save plot to plot3.png
png('plot3.png', width=480, height=480)
plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp,data$Sub_metering_2,col="red")
lines(data$timestamp,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()