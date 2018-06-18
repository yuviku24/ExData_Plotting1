#Read the table values corresponding to 2/1/2007 and 2/2/2007
data<-read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Replaces the date values with the appropriate date format
data$Date<- as.Date(data[,"Date"],format = "%d/%m/%Y")
#Reorganizes the date and time columns of the dataset into one variable called datetime
datetime<-strptime(paste(data$Date,data$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
#Creates appropriate line plot (using type="l") with correct labels
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Creates png file
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
