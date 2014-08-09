df <- read.csv2("household_power_consumption.txt", na.strings = "?", colClasses = "character", nrows = 70000)
good1 <- df$Date == "1/2/2007"
good2 <- df$Date == "2/2/2007"
good3 <- good1 | good2

df <- df[good3,]
par(mfrow = c(1,1))
df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
plot(df$Date, df$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()