# Loads the data
dset<- read.table("household_power_consumption.txt", col.names = 
                    c("Date", "Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3"), sep = ";", na.strings = "?",
                  skip = 66637, nrows = 2880)

# Converts date and time into single column and POSIXlt class
dset$Date<-strptime(paste(dset$Date,dset$Time), "%d/%m/%Y %H:%M:%S")

# Opens png file for writing
png(filename = "plot3.png", width = 480, height = 480, units = "px", res = NA, bg= "white")

# Builds a line plot for each sub metering over time
with(dset, plot(Date,Sub_metering_1, type = "l", col = "black", 
    ylab = "Energy sub metering", xlab = ""))
with(dset, lines(Date,Sub_metering_2, type = "l", col = "red"))
with(dset, lines(Date,Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1 ,col = c("black","red","blue"), legend = c("Sub_metering_1",
    "Sub_metering_2","Sub_metering_3"))

# Closes png file
dev.off()
