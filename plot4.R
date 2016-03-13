f.path <- "household_power_consumption.txt"
file <- read.table(f.path, stringsAsFactors = FALSE, sep=";", header = TRUE)
file$Date.Time <- strptime(paste(file$Date, file$Time), "%d/%m/%Y %H:%M:%S")
file$Date <- as.Date(file$Date,"%d/%m/%Y")
file <- subset(file, Date %in% c(as.Date("1/2/2007","%d/%m/%Y"),as.Date("2/2/2007","%d/%m/%Y")))
file$Sub_metering_1 <- as.numeric(file$Sub_metering_1)
file$Sub_metering_2 <- as.numeric(file$Sub_metering_2)
file$Sub_metering_3 <- as.numeric(file$Sub_metering_3)
file$Global_active_power <- as.numeric(file$Global_active_power)
file$Voltage <- as.numeric(file$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(file$Date.Time,
     file$Global_active_power,
     type = "l",
     ylab="Global Active Power",
     xlab = ""
)

plot(file$Date.Time,
     file$Voltage,
     type = "l",
     ylab="Voltage",
     xlab = "datetime"
)

plot(file$Date.Time,
     file$Sub_metering_1,
     type = "l",
     ylab="Energy sub metering",
     xlab = ""
)
lines(file$Date.Time,file$Sub_metering_2, col="red")
lines(file$Date.Time,file$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

plot(file$Date.Time,
     file$Global_reactive_power,
     type = "l",
     ylab="Global_reactive_power",
     xlab = "datetime"
)

dev.off()