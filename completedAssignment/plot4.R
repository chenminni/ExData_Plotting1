
#### read data
df <- read.csv2("household_power_consumption.txt", na.strings = "?", colClasses = "character", nrows = 70000)
good1 <- df$Date == "1/2/2007"
good2 <- df$Date == "2/2/2007"
good3 <- good1 | good2

df <- df[good3,]





df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Voltage <- as.numeric(df$Voltage)


### plot on screen

### 4 x 4 plots
par(mfrow = c(2,2))
plot(df$Date, df$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
plot(df$Date, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
legTxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
g <- gl(3,2880, labels = legTxt)
x <- c(df$Date, df$Date, df$Date)
y <- c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3)
plot(x, y, type = "n", xlab = "", ylab= "Energy sub metering" )
lines(x[g == "Sub_metering_1"], y[g == "Sub_metering_1"], col = "black")
lines(x[g == "Sub_metering_2"], y[g == "Sub_metering_2"], col = "red")
lines(x[g == "Sub_metering_3"], y[g == "Sub_metering_3"], col = "blue")

legend("topright", legend = legTxt, col = c("black","red", "blue"), lty = 1, merge = TRUE, inset=0, bty = "n")

plot(df$Date, df$Global_reactive_power, type = "l", xlab = "datetime", ylab= "Global Reactive Power (kilowatts)")
#### end plot on screen


##### plot on png


png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
### 4 x 4 plots
par(mfrow = c(2,2))
plot(df$Date, df$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
plot(df$Date, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
legTxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
g <- gl(3,2880, labels = legTxt)
x <- c(df$Date, df$Date, df$Date)
y <- c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3)
plot(x, y, type = "n", xlab = "", ylab= "Energy sub metering" )
lines(x[g == "Sub_metering_1"], y[g == "Sub_metering_1"], col = "black")
lines(x[g == "Sub_metering_2"], y[g == "Sub_metering_2"], col = "red")
lines(x[g == "Sub_metering_3"], y[g == "Sub_metering_3"], col = "blue")
legend("topright", legend = legTxt, col = c("black","red", "blue"), lty = 1, merge = TRUE, inset=0, bty = "n")
plot(df$Date, df$Global_reactive_power, type = "l", xlab = "datetime", ylab= "Global Reactive Power (kilowatts)")
dev.off()