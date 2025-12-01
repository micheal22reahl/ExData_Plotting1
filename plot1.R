## plot2.R
## Creates plot2.png: line plot of Global Active Power over time

# Load and preprocess data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data2$Datetime <- as.POSIXct(paste(data2$Date, data2$Time))

# Make Plot 2
png("plot2.png", width = 480, height = 480)
plot(data2$Datetime,
     data2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
