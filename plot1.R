# plot of global active power vs. frequency
# read in dates between 2007-02-01 and 2007-02-02
#data2007<- data[, "Date"= 2007-02-01:2007-02-02]

#read in the data
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";", stringsAsFactors=FALSE)

#add the date range and convert to timestamp to subset the data
mydates <- c("1/2/2007", "2/2/2007")
data$timestamp <- as.POSIXct( paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S" )
subdata <- data[data$Date %in% mydates,]

#plot global active power
par(mfrow=c(1,1))
hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
