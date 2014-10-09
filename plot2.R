
setwd("/Users/Riteshsinha/documents/coursera/eda/")
hpc <- read.table("household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE)
hpc$Date1 <- as.Date(hpc$Date, "%d/%m/%Y")
i <- (hpc$Date1 == '2007-02-01') | (hpc$Date1 == '2007-02-02')
hpc.2.days <- hpc[i,]
rm(hpc)
idx <- (hpc.2.days$Global_active_power == "?")
hpc.2.days[idx, which(colnames(hpc.2.days)== 'Global_active_power')] = NA
# Change from character to numeric.
hpc.2.days$Global_active_power = as.numeric(hpc.2.days$Global_active_power)
# Plot 2 started ******************
temp <- paste(hpc.2.days$Date, hpc.2.days$Time , sep = " ")
hpc.2.days$Date.Time <- strptime(temp,"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(hpc.2.days$Date.Time,hpc.2.days$Global_active_power, type = 'line', ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()
# Plot 2 finished
