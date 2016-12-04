# Create Plot #3 - Energy Sub Metering 
# MAC, 12/03/2016

# Read in all data
p0 <- read.table("data/household_power_consumption.txt", sep = ";", header = T, as.is = T)

# Subset data 
p1 <- p0[p0$Date == "1/2/2007" | p0$Date == "2/2/2007",]

p1$DateTime <- paste(p1$Date, p1$Time)

# Convert "Date" column from char to Date format
p1$DateTime <- strptime(p1$DateTime, "%d/%m/%Y %H:%M:%S")

# Convert "char" col to numeric 
p1$Sub_metering_1 <- as.numeric(p1$Sub_metering_1)
p1$Sub_metering_2 <- as.numeric(p1$Sub_metering_2)

# Create plot
with(p1, plot(DateTime, Sub_metering_1, type = "n", pch = 15, xlab = "", ylab = "Energy sub metering"))
     
points(p1$DateTime, p1$Sub_metering_1, col = "black", pch = 22, cex = 0.4)
points(p1$DateTime, p1$Sub_metering_2, col = "red", pch = 22, cex = 0.4)
points(p1$DateTime, p1$Sub_metering_3, col = "blue", pch = 22, cex = 0.4)

# Connect dots with lines
lines(p1$DateTime, p1$Sub_metering_1, lwd = 1)
lines(p1$DateTime, p1$Sub_metering_2, lwd = 1)
lines(p1$DateTime, p1$Sub_metering_3, lwd = 1)

legend("topright", pch = 15, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1      ", "Sub_metering_2       ", "Sub_metering_3       "))

dev.copy(png, file = "plot3.png")

dev.off()

