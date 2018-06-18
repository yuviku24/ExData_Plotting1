#Read table values for 1/2/2007 and 2/2/2007
data<-read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Replaces the date column with the appropriate date format
data$Date<- as.Date(data[,"Date"],format = "%d/%m/%Y")
#Combines the date and time into one category called datetime
datetime<-strptime(paste(data$Date,data$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
#Creates a 2 by 2 panel to put 4 graphs on 
par(mfrow=c(2,2))
#All the graphs are plotted with appropriate labels and legend calls
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
lines(datetime,data$Sub_metering_2,col="red") 
lines(datetime,data$Sub_metering_3,col="blue") 
legend("topright", col = c("black", "red", "blue"),lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime,data$Global_active_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#png file is created
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
