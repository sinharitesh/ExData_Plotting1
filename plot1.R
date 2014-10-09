
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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(hpc.2.days$Global_active_power, col = 'red', xlab ="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()



