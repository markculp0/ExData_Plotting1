# Create Plot #1 - Global Active Power histogram
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


hist(p1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")

dev.off()



s0 <- read.table("data/small.txt", sep = ";", header = T, as.is = T)

s1 <- s0[s0$Date == "17/12/2006" | s0$Date == "16/12/2006",]

s1$DateTime <- paste(s1$Date, s1$Time)
s1$DateTime <- strptime(s1$DateTime, "%d/%m/%Y %H:%M:%S")

s1$Global_active_power <- as.numeric(s1$Global_active_power)






p0[,"Date"] <- sapply(p0[,"Date"], as.Date)

             
s0$d3 <- strptime(s0$Date, format = "%d/%m/%y")

s1 <- s0[s0$d3 >= 17/12/2006 && s0$d3 <= 19/12/2006,]


p1 <- p0[p0$Date >= 01/02/2006 && p0$Date <= 02/02/2006,]

# or 

# subset(data, Date >= "01/02/2007" & Date <= "02/02/2007")

