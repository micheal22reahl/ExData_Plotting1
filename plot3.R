## plot3.R
## Creates plot3.png: energy sub metering over time

# Load and preprocess data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data2$Datetime <- as.POSIXct(paste(data2$Date, data2$Time))

# Make Plot 3
png("plot3.png", width = 480, height = 480)

plot(data2$Datetime,
     data2$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data2$Datetime, data2$Sub_metering_2, col = "red")
lines(data2$Datetime, data2$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

dev.off()
