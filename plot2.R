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

#Plot a line graph and save it to png format.
plot(as.POSIXlt(paste(data$Date, data$Time),format="%d/%m/%Y %T")
     , data$Global_active_power, type="l"
     , xlab = "", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
graphics.off()
