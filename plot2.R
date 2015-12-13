#Plot the Global Active Power for the date range

#read the data
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";", stringsAsFactors=FALSE)

#add the date range and convert to timestamp to subset the data
mydates <- c("1/2/2007", "2/2/2007")
data$timestamp <- as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S" )
subdata <- data[data$Date %in% mydates,]

#plot global active power for the date range
par(mfrow=c(1,1))
plot(subdata$timestamp,subdata$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

