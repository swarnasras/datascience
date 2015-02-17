a=read.csv("healthdata.csv")
a$Height=as.character(a$Height)
a$Height=as.numeric(a$Height)
a$DPI=as.character(a$DPI)
a$DPI=as.numeric(a$DPI)
b=a[a$Gender=="F",]
c=a[a$Gender=="M",]
d=rbind(b,c)
d$DPIQuantile=cut(d$DPI,breaks=quantile(d$DPI,na.rm=T))
d$HeightQuantile=cut(d$Height,breaks=quantile(d$Height,na.rm=T))
#a$HeightQuantile=cut(d$Height, breaks=c(120,130,140,150,160,170))

qplot(Height,Weight,data=a, color=Gender, facets=.~Batch,geoms=c("point","smooth"), method="lm")
qplot(Height,DPI,data=d, color=Gender, facets=.~HeightQuantile,geoms=c("point","smooth"), method="lm")
qplot(Height,DPI,data=d, color=Gender, facets=.~Batch, method="lm") +geom_smooth()
qplot(Height,data=d)
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
