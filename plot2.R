f.path <- "household_power_consumption.txt"
file <- read.table(f.path, stringsAsFactors = FALSE, sep=";", header = TRUE)
file$Date.Time <- strptime(paste(file$Date, file$Time), "%d/%m/%Y %H:%M:%S")
file$Date <- as.Date(file$Date,"%d/%m/%Y")
file$Global_active_power <- as.numeric(file$Global_active_power)
file <- subset(file, Date %in% c(as.Date("1/2/2007","%d/%m/%Y"),as.Date("2/2/2007","%d/%m/%Y")))

png("plot2.png", width=480, height=480)

plot(file$Date.Time,
     file$Global_active_power,
     type = "l",
     ylab="Global Active Power (kilowatts)",
     xlab = ""
)

dev.off()