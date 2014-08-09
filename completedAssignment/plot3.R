df <- read.csv2("household_power_consumption.txt", na.strings = "?", colClasses = "character", nrows = 70000)
good1 <- df$Date == "1/2/2007"
good2 <- df$Date == "2/2/2007"
good3 <- good1 | good2
par(mfrow = c(1,1))
df <- df[good3,]

df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

legTxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
g <- gl(3,2880, labels = legTxt)
x <- c(df$Date, df$Date, df$Date)
y <- c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3)
plot(x, y, type = "n", xlab = "", ylab= "Energy sub metering" )
lines(x[g == "Sub_metering_1"], y[g == "Sub_metering_1"], col = "black")
lines(x[g == "Sub_metering_2"], y[g == "Sub_metering_2"], col = "red")
lines(x[g == "Sub_metering_3"], y[g == "Sub_metering_3"], col = "blue")

legend("topright", legend = legTxt, col = c("black","red", "blue"), lty = 1, merge = TRUE)


png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(x, y, type = "n", xlab = "", ylab= "Energy sub metering" )
lines(x[g == "Sub_metering_1"], y[g == "Sub_metering_1"], col = "black")
lines(x[g == "Sub_metering_2"], y[g == "Sub_metering_2"], col = "red")
lines(x[g == "Sub_metering_3"], y[g == "Sub_metering_3"], col = "blue")

legend("topright", legend = legTxt, col = c("black","red", "blue"), lty = 1, merge = TRUE)

dev.off()