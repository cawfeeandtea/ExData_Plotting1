# Plot 1: Global Active Power Histogram

# Read in data from household_power_consumption.txt file
info <- read.table("household_power_consumption.txt", header=T, sep=";")
info$Date <- as.Date(info$Date, format="%d/%m/%Y")

#Subset of data from specific timeframe
data <- info[(info$Date=="2007-02-01") | (info$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Create histogram
hist(data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

#Create file plot1.png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()