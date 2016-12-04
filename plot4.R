# Create Plot #4 - Four Energy Plots
# MAC, 12/03/2016

# Read in all data
p0 <- read.table("data/household_power_consumption.txt", sep = ";", header = T, as.is = T)

# Subset data 
p1 <- p0[p0$Date == "1/2/2007" | p0$Date == "2/2/2007",]

p1$DateTime <- paste(p1$Date, p1$Time)

# Convert "Date" column from char to Date format
p1$DateTime <- strptime(p1$DateTime, "%d/%m/%Y %H:%M:%S")

# Convert "char" col to numeric 
p1$Global_active_power <- as.numeric(p1$Global_active_power)
p1$Global_reactive_power <- as.numeric(p1$Global_reactive_power)
p1$Voltage <- as.numeric(p1$Voltage)

# Convert "char" col to numeric 
p1$Sub_metering_1 <- as.numeric(p1$Sub_metering_1)
p1$Sub_metering_2 <- as.numeric(p1$Sub_metering_2)

par(mfcol = c(2,2))


# Create plot #1
with(p1, plot(DateTime, Global_active_power, cex = 0.2, pch = 20, xlab = "", ylab = "Global Active Power (kilowatts)"))

# Connect dots on plot #1
lines(p1$DateTime, p1$Global_active_power)

# Create plot #2
with(p1, plot(DateTime, Sub_metering_1, type = "n", pch = 15, xlab = "", ylab = "Energy sub metering"))

points(p1$DateTime, p1$Sub_metering_1, col = "black", pch = 22, cex = 0.4)
points(p1$DateTime, p1$Sub_metering_2, col = "red", pch = 22, cex = 0.4)
points(p1$DateTime, p1$Sub_metering_3, col = "blue", pch = 22, cex = 0.4)

# Connect dots with lines to plot #2
lines(p1$DateTime, p1$Sub_metering_1, lwd = 1)
lines(p1$DateTime, p1$Sub_metering_2, lwd = 1)
lines(p1$DateTime, p1$Sub_metering_3, lwd = 1)

legend("topright", pch = 15, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1      ", "Sub_metering_2       ", "Sub_metering_3       "))

# Create plot #3
with(p1, plot(DateTime, Voltage, cex = 0.2, pch = 20, xlab = "datetime", ylab = "Voltage"))

# Connect the dots of plot #3
with(p1, lines(DateTime, Voltage, lwd = 1))

# Create plot #4
with(p1, plot(DateTime, Global_reactive_power, cex = 0.2, pch = 20, xlab = "datetime", ylab = "Global reactive power"))

# Connect the dots of plot #4
with(p1, lines(DateTime, Global_reactive_power, lwd = 1))

dev.copy(png, file = "plot4.png")

dev.off()

