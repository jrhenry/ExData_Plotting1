# Loads the data
dset<- read.table("household_power_consumption.txt", col.names = 
                    c("Date", "Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3"), sep = ";", na.strings = "?",
                  skip = 66637, nrows = 2880)

# Converts date and time into single column and POSIXlt class
dset$Date<-strptime(paste(dset$Date,dset$Time), "%d/%m/%Y %H:%M:%S")

# Opens png file for writing
png(filename = "plot4.png", width = 480, height = 480, units = "px", res = NA, bg= "white")

# Sets parameters for a 2x2 set of plots plotting columns first
par(mfcol = c(2,2))

# Builds a line plot for global active power over time
with(dset, plot(Date,Global_active_power, type = "l", ylab = "Global Active Power"))

# Builds a line plot for each sub metering over time
with(dset, plot(Date,Sub_metering_1, type = "l", col = "black", 
                ylab = "Energy sub metering", xlab = ""))
with(dset, lines(Date,Sub_metering_2, type = "l", col = "red"))
with(dset, lines(Date,Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1 , bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1",
    "Sub_metering_2","Sub_metering_3"))

# Builds a line plot of voltage over time
with(dset, plot(Date, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Builds a line plot of global reactive power over time
with(dset, plot(Date,Global_reactive_power, type = "l", xlab = "datetime"))

# Resets plotting parameter
par(mfcol = c(1,1))

# Closes png file
dev.off()
