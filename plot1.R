f.path <- "household_power_consumption.txt"
file <- read.table(f.path, stringsAsFactors = FALSE, sep=";", header = TRUE)
file$Date <- as.Date(file$Date,"%d/%m/%Y")
file$Global_active_power <- as.numeric(file$Global_active_power)
file <- subset(file, Date %in% c(as.Date("1/2/2007","%d/%m/%Y"),as.Date("2/2/2007","%d/%m/%Y")))

png("plot1.png", width=480, height=480)

hist(file$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
     )

dev.off()