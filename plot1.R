# Close all graphics
graphics.off()

# Read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?",
                   colClasses=c(rep("character",2), rep("numeric", 7)))
dates <- as.Date(data[,"Date"], format='%d/%m/%Y')
data <- data[dates >= '2007-02-01' & dates <= '2007-02-02',]
dateTime <- strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

# Plot 1
x11()
hist(data[,3], breaks=seq(0,7.5,length=16), col='red', 
     xlab='Global Active Power (kilowatts)', main="Global Active Power",
     xaxt="n")
#xlim=c(0,6), xaxp=c(0,max(data[,3]),1))
axis(1, at=c(0,2,4,6))

# Save to file
dev.copy(png, file ="plot1.png", width=480, height=480)
dev.off()
