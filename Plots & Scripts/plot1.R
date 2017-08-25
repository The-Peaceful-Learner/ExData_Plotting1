M4Week1AssgnData<-read.table("household_power_consumption.txt",header = TRUE, sep = ";")
M4Week1AssgnData$Date<-as.Date(M4Week1AssgnData$Date,"%d/%m/%Y")
M4Week1AssgnData$Time<-as.character(M4Week1AssgnData$Time)
M4Week1AssgnData$Time<-strptime(paste(M4Week1AssgnData$Date,M4Week1AssgnData$Time),format = "%F %H:%M:%S")

HH_EngData_Feb2007<-M4Week1AssgnData[M4Week1AssgnData$Date>="2007-02-01" & M4Week1AssgnData$Date<="2007-02-02",]

png(filename = "plot1.png")## Open png device; create 'plot1.png' in my working directory
HH_EngData_Feb2007$Global_active_power<-as.character(HH_EngData_Feb2007$Global_active_power)
HH_EngData_Feb2007$Global_active_power<-as.numeric(HH_EngData_Feb2007$Global_active_power)
hist(HH_EngData_Feb2007$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() ## Close the PNG file device
## Now you can view the file 'plot1.png' on your computer