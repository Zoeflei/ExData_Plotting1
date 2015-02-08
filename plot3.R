## Get the full dataset
ePowerConsumption <- read.table("./edaData/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
ePowerConsumption$Date <- as.Date(ePowerConsumption$Date, format = "%d/%m/%Y")

##Subset data for date ranges: 2007-02-01 to 2007-02-02
epConsumptionSubset <- subset(ePowerConsumption, as.Date(Date)>= "2007-02-01" & as.Date(Date) <= "2007-02-02")
datetime <- paste(as.Date(epConsumptionSubset$Date), epConsumptionSubset$Time)
epConsumptionSubset$Datetime <- as.POSIXct(datetime)

##Plot 2
with(epConsumptionSubset, {
  plot(Sub_metering_1~Datetime, type = "l",
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col = "Red")
  lines(Sub_metering_3~Datetime, col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save and close file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()