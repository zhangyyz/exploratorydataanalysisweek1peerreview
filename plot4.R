#Download and unzip the file to folder 'dataset'
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip")
unzip(zipfile = "temp.zip", exdir = "dataset")

#Read data from 1/2/2007 to 2/2/2007
data <- read.csv("dataset/household_power_consumption.txt", header = FALSE
                 , skip=66637, nrow=2880, sep=";") 
#Read the header
header <- read.csv("dataset/household_power_consumption.txt", header = FALSE
                   , nrow=1, sep=";", colClasses = "character") 
colnames(data)  <- header[1, ]

#Generate a 2x2 plot
par(mfrow=c(2,2))
par(mar=c(4,4.5,2,1))
#Plot the first graph
plot(as.POSIXlt(paste(data$Date, data$Time),format="%d/%m/%Y %T")
     , data$Global_active_power, type="l"
     , xlab = "", ylab="Global Active Power")
#Plot the second graph
plot(as.POSIXlt(paste(data$Date, data$Time),format="%d/%m/%Y %T")
     , data$Voltage, type="l"
     , xlab = "datetime", ylab="Voltage")
#Plot the third graph
x <- as.POSIXlt(paste(data$Date, data$Time),format="%d/%m/%Y %T")
plot(x, data$Sub_metering_1, type="l", xlab = ""
     , ylab="Energy sub metering"
     , col="black")  # Sub_metering_1 plotted
lines(x, data$Sub_metering_2, type="l", col="red") # Sub_metering_2 added
lines(x, data$Sub_metering_3, type="l", col="blue") # Sub_metering_3 added
par(mar=c(1,0,1,0))
legend("topright", col=c("black", "red", "blue")
       , lty = 1
       , seg.len = 1
       , bty = "n"
       , legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))
#Plot the forth graph
par(mar=c(4,4.5,2,1))
plot(as.POSIXlt(paste(data$Date, data$Time),format="%d/%m/%Y %T")
     , data$Global_reactive_power, type="l"
     , xlab = "datetime", ylab="Global_reactive_power")

dev.copy(png, "plot4.png")
graphics.off()