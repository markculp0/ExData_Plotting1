# Create Plot #2 - Global Active Power histogram
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

# Create plot
with(p1, plot(DateTime, Global_active_power, cex = 0.2, pch = 20, xlab = "", ylab = "Global Active Power (kilowatts)"))

# Connect dots with lines
lines(p1$DateTime, p1$Global_active_power)

dev.copy(png, file = "plot2.png")

dev.off()

