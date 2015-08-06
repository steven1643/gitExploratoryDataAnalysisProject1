setwd("C:/Users/steven.aurousseau/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1")
# setwd("~/Box Sync/Programming/Coursera - Data Science/4.0 Exploratory Data Analysis/Project1") # mac

## Get data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="householdPowerConsumption.zip", mode="wb")
unzip("householdPowerConsumption.zip")

# look at formating
file <- "household_power_consumption.txt"
housePower <- read.table(file, header=FALSE, sep=";", skip=23000, nrows=5)
head(housePower)
#         V1       V2    V3    V4     V5  V6 V7 V8 V9
# 1 1/1/2007 16:43:00 1.474 0.000 241.90 6.0  0  0 18
# 2 1/1/2007 16:44:00 1.474 0.000 242.07 6.0  0  0 18

# get data from dates 2007-02-01 to 2007-02-02 inclusive
housePower <- read.table(file, header=FALSE, sep=";", 
                          na.strings="?",
                          skip=grep("1/2/2007", readLines(file)), 
                          nrows=2879, # (2d * 24hr * 60min) - 1min = 2879mins
                          stringsAsFactors=FALSE) 

# Plot histogram
with(housePower, hist(V3, col="red",
                      xlab="Global Active Power (kilowatts)",
                      ylab="Frequency", 
                      main="Global Active Power"))
# save as png file
dev.copy(png, file="plot1.png")
dev.off()




