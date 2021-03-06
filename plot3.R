# Close all graphics
graphics.off()

# Read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?",
                   colClasses=c(rep("character",2), rep("numeric", 7)))
dates <- as.Date(data[,"Date"], format='%d/%m/%Y')
data <- data[dates >= '2007-02-01' & dates <= '2007-02-02',]
dateTime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

# Plot 3
x11()
plot(dateTime, data[,3], type="n", xlab="",
     ylab="Energy sub metering", ylim=c(0,38))
lines(dateTime, data[,7], col='black')
lines(dateTime, data[,8], col='red')
lines(dateTime, data[,9], col='blue')
legend(x="topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))


# Save to file
dev.copy(png, file ="plot3.png", width=480, height=480)
dev.off()
