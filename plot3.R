
setwd("/Users/Riteshsinha/documents/coursera/eda/")
hpc <- read.table("household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE)
hpc$Date1 <- as.Date(hpc$Date, "%d/%m/%Y")
i <- (hpc$Date1 == '2007-02-01') | (hpc$Date1 == '2007-02-02')
hpc.2.days <- hpc[i,]
rm(hpc)
idx <- (hpc.2.days$Global_active_power == "?")
hpc.2.days[idx, which(colnames(hpc.2.days)== 'Global_active_power')] = NA
hpc.2.days$Global_active_power = as.numeric(hpc.2.days$Global_active_power)
temp <- paste(hpc.2.days$Date, hpc.2.days$Time , sep = " ")
hpc.2.days$Date.Time <- strptime(temp,"%d/%m/%Y %H:%M:%S")

# Plot 3 started
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_1, type = 'line', ylab = "Global Active Power (kilowatts)", xlab="")
#plot(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_2, type = 'line', ylab = "Global Active Power (kilowatts)", xlab="")
points(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_2, type = 'line', col = 'red')
points(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_3, type = 'line', col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1:1, col = c('black','red', 'blue'), cex = .7)
dev.off()

