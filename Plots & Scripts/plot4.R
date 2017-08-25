M4Week1AssgnData<-read.table("household_power_consumption.txt",header = TRUE, sep = ";")
M4Week1AssgnData$Date<-as.Date(M4Week1AssgnData$Date,"%d/%m/%Y")
M4Week1AssgnData$Time<-as.character(M4Week1AssgnData$Time)
M4Week1AssgnData$Time<-strptime(paste(M4Week1AssgnData$Date,M4Week1AssgnData$Time),format = "%F %H:%M:%S")

HH_EngData_Feb2007<-M4Week1AssgnData[M4Week1AssgnData$Date>="2007-02-01" & M4Week1AssgnData$Date<="2007-02-02",]

png(filename = "plot4.png")## Open png device; create 'plot4.png' in my working directory
par(mfcol = c(2,2),mar = c(4,4,2,1))
with(HH_EngData_Feb2007,plot(Time,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))

plot(x = HH_EngData_Feb2007$Time, y = HH_EngData_Feb2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = HH_EngData_Feb2007$Time, y = HH_EngData_Feb2007$Sub_metering_2, col = "red")
lines(x = HH_EngData_Feb2007$Time, y = HH_EngData_Feb2007$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5)

with(HH_EngData_Feb2007,plot(Time,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))
with(HH_EngData_Feb2007,plot(Time,Global_reactive_power,type = "l",xlab = "datetime"))

dev.off() ## Close the PNG file device
## Now you can view the file 'plot4.png' on your computer