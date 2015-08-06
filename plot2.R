setwd("C:/Users/steven.aurousseau/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1")
# setwd("~/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1") # mac

## Get data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="householdPowerConsumption.zip", mode="wb")
unzip("householdPowerConsumption.zip")

# get data from dates 2007-02-01 to 2007-02-02 inclusive
housePower <- read.table(file, header=FALSE, sep=";", 
                          na.strings="?",
                          skip=grep("1/2/2007", readLines(file)), 
                          nrows=2879, # (2d * 24hr * 60min) - 1min = 2879mins
                          stringsAsFactors=FALSE) 

housePower$time <- as.POSIXct(paste(housePower$V1, housePower$V2), format="%d/%m/%Y %H:%M:%S")
# str(housePower)

# Plot
with(housePower, plot(time, V3, type="l", xlab="",
                      ylab="Global Active Power (kilowatts)"))
# save as png file
dev.copy(png, file="plot2.png")
dev.off()


