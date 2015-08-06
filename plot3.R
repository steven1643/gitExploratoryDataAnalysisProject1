setwd("C:/Users/steven.aurousseau/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1")
# setwd("~/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1") # mac

## Get data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="householdPowerConsumption.zip", mode="wb")
unzip("householdPowerConsumption.zip")

# get data from dates 2007-02-01 to 2007-02-02 inclusive
file <- "household_power_consumption.txt"
housePower <- read.table(file, header=FALSE, sep=";", 
                          na.strings="?",
                          skip=grep("1/2/2007", readLines(file)), 
                          nrows=2879, # (2d * 24hr * 60min) - 1min = 2879mins
                          stringsAsFactors=FALSE) 

housePower$time <- as.POSIXct(paste(housePower$V1, housePower$V2), format="%d/%m/%Y %H:%M:%S")
# str(housePower)

# Plot
with(housePower, plot(time, V7, type="l", xlab="", ylab="Energy sub metering"))
with(housePower, lines(time, V8, col="red"))
with(housePower, lines(time, V9, col="blue"))
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"))

# save as png file
dev.copy(png, file="plot3.png")
dev.off()
