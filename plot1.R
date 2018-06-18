#Read the rows of table that correspond to 1/2/17 and 2/2/17
data<-read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Creates the histogram (red color with appropriate title and axis labels
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Creates the png file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
