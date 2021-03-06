#Read table values for 1/2/2007 and 2/2/2007
data<-read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Replaces the date column with the appropriate date format
data$Date<- as.Date(data[,"Date"],format = "%d/%m/%Y")
#Combines the date and time into one category called datetime
datetime<-strptime(paste(data$Date,data$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
#Plots a line graph (type="l") with datetime on the x axis and Sub_metering_1 on the y axis, Then 2 other line graphs and a legend are created on the same plot.
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
lines(datetime,data$Sub_metering_2,col="red") 
lines(datetime,data$Sub_metering_3,col="blue") 
legend("topright", col = c("black", "red", "blue"),lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Creates a png file
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
