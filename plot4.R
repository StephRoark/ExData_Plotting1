
#Plot 1 Global Active Power for the date range
#Plot 2 Voltage for the date range
#Plot 3 sub-metering variables for power usage
#Plot 4 Global Reactive Power for the date range

#Read in the data
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";", stringsAsFactors=FALSE)

#add the date range and convert to timestamp to subset the data
mydates <- c("1/2/2007", "2/2/2007")
data$timestamp <- as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S" )
subdata <- data[data$Date %in% mydates,]

#set the placement of the graphs
par(mfrow = c(2,2), mar=c(4, 4, 2, 2) + 0.1)

#Plot1
plot(subdata$timestamp,subdata$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot2
plot(subdata$timestamp,subdata$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

#Plot3
plot(subdata$timestamp,subdata$Sub_metering_1  ,type = "l", xlab = "", ylab = "Energy sub metering")
points(subdata$timestamp, subdata$Sub_metering_2, col = "red", type = "l")
points(subdata$timestamp, subdata$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1), bty="n", cex= 0.5, xjust=1, inset = 0.1)

#Plot4
plot(subdata$timestamp,subdata$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
