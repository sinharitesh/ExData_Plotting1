
setwd("/Users/Riteshsinha/documents/coursera/eda/")
hpc <- read.table("household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE)
hpc$Date1 <- as.Date(hpc$Date, "%d/%m/%Y")
i <- (hpc$Date1 == '2007-02-01') | (hpc$Date1 == '2007-02-02')
hpc.2.days <- hpc[i,]
rm(hpc)
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

idx <- (hpc.2.days$Global_active_power == "?")
hpc.2.days[idx, which(colnames(hpc.2.days)== 'Global_active_power')] = NA
# Change from character to numeric.
hpc.2.days$Global_active_power = as.numeric(hpc.2.days$Global_active_power)
temp <- paste(hpc.2.days$Date, hpc.2.days$Time , sep = " ")
hpc.2.days$Date.Time <- strptime(temp,"%d/%m/%Y %H:%M:%S")
#
#PLOT 1#
plot(hpc.2.days$Date.Time,hpc.2.days$Global_active_power, type = 'line', ylab = "Global Active Power (kilowatts)", xlab="")

#PLOT 2#
plot(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_1, type = 'line', ylab = "Global Active Power (kilowatts)", xlab="")
points(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_2, type = 'line', col = 'red')
points(hpc.2.days$Date.Time,hpc.2.days$Sub_metering_3, type = 'line', col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1:1, col = c('black','red', 'blue'), cex = .5)
#dev.off()

#PLOT 3#

idx <- (hpc.2.days$Voltage == "?")
hpc.2.days[idx, which(colnames(hpc.2.days)== 'Voltage')] = NA
hpc.2.days$Voltage = as.numeric(hpc.2.days$Voltage)
plot(hpc.2.days$Date.Time,hpc.2.days$Voltage, type = 'line', ylab = "Voltage",xlab="datetime")

#PLOT 4#


idx <- (hpc.2.days$Global_reactive_power == "?")
hpc.2.days[idx, which(colnames(hpc.2.days)== 'Global_reactive_power')] = NA
hpc.2.days$Global_reactive_power = as.numeric(hpc.2.days$Global_reactive_power)
plot(hpc.2.days$Date.Time,hpc.2.days$Global_reactive_power, type = 'line', ylab = "Global_reactive_power",xlab="datetime")


dev.off()