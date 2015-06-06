# Plot 2: Global Active Power

# Read in data from household_power_consumption.txt file
info <- read.table("household_power_consumption.txt", header=T, sep=";")
info$Date <- as.Date(info$Date, format="%d/%m/%Y")

#Subset of data from specific timeframe
data <- info[(info$Date=="2007-02-01") | (info$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Save plot as plot2.png
png('plot2.png', width = 480, height = 480)
plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()