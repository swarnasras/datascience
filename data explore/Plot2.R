#reads file
library("data.table")
file=fread("household_power_consumption.txt")
file1=as.data.frame(file)
rm(file)

#checks if date is 1st or 2nd feb 2007
data=file1[file1$Date %in% c("1/2/2007","2/2/2007"),]
rm(file1)

#converts data types
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power=as.numeric(data$Global_active_power)
data$Global_reactive_power=as.numeric(data$Global_reactive_power)
data$Voltage=as.numeric(data$Voltage)
data$Global_intensity=as.numeric(data$Global_intensity)
data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)

data$Time=as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#plots the chart
png(filename="plot2.png", width=504, height=504)
par(bg = "transparent")
plot(data$Time,data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="n")
lines(data$Time,data$Global_active_power)
dev.off()