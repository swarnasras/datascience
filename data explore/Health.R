qplot(Height,Weight,data=a, color=Gender, facets=.~Batch,geoms=c("point","smooth"), method="lm")
subset(a,a$Gender=="M")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
two.days <- all.data[all.data$Date == "1/2/2007" | all.data$Date == "2/2/2007",]

## sqldf package utilised to load in just the dates required for the analysis
require(sqldf)

## read in data with 1/2/2007 or 2/2/2007 filter
powerData <- read.csv.sql("Assign1/Data/household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', header = TRUE, sep = ";")

sqldf() ## close sql connection

## reclass date and time
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- strptime(paste(powerData$Date,powerData$Time), "%Y-%m-%d %H:%M:%S") ## combine date and time
