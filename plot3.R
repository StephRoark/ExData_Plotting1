
#Plot the 3 sub-metering variables for power usage

#read the data
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";", stringsAsFactors=FALSE)

#add the date range and convert to timestamp to subset the data
mydates <- c("1/2/2007", "2/2/2007")
data$timestamp <- as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S" )
subdata <- data[data$Date %in% mydates,]

par(mfrow=c(1,1))

#plot the first submetering data in black
plot(subdata$timestamp,subdata$Sub_metering_1  ,type = "l", xlab = "", ylab = "Energy sub metering")

#plot the 2nd submetering data in red
points(subdata$timestamp, subdata$Sub_metering_2, col = "red", type = "l")

#plot the 3rd submetering data in blue
points(subdata$timestamp, subdata$Sub_metering_3, col = "blue", type = "l")

#add a legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1), bty="n", cex= 0.75, xjust=1, inset = 0.1)
