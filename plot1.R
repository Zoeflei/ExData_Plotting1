## Get the full dataset
ePowerConsumption <- read.table("./edaData/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
ePowerConsumption$Date <- as.Date(ePowerConsumption$Date, format = "%d/%m/%Y")

##Subset data for date ranges: 2007-02-01 to 2007-02-02
epConsumptionSubset <- subset(ePowerConsumption, as.Date(Date)>= "2007-02-01" & as.Date(Date) <= "2007-02-02")
datetime <- paste(as.Date(epConsumptionSubset$Date), epConsumptionSubset$Time)
epConsumptionSubset$Datetime <- as.POSIXct(datetime)

##Plot 1
hist(epConsumptionSubset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

##Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()