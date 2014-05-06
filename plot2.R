# Close all graphics
graphics.off()

# Read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?",
                   colClasses=c(rep("character",2), rep("numeric", 7)))
dates <- as.Date(data[,"Date"], format='%d/%m/%Y')
data <- data[dates >= '2007-02-01' & dates <= '2007-02-02',]
dateTime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")


# Plot 2
x11()
plot(dateTime, data[,3], type="n", xlab="",
     ylab="Global Active Power (kilowatts)")
lines(dateTime, data[,3])

# Save to file
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()
