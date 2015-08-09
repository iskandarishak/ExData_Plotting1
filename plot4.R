## read electric power consumption full dataset
household.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
household.data$Date <- as.Date(household.data$Date, format = "%d/%m/%Y")

## Subsetting the data
selected.data <- household.data[which(household.data$Date >= "2007-02-01" & household.data$Date <= "2007-02-02"), ]

## Converting dates
datetime <- paste(selected.data$Date, selected.data$Time, sep=" ")
datetime <- as.POSIXlt(datetime, "UTC") 

## Plot 4 different graphs
par(mfrow =c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(selected.data, {
  plot(datetime, Global_active_power,  type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(datetime, Sub_metering_2,col='Red')
    lines(datetime, Sub_metering_3,col='Blue')
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), cex = .35, text.font= 2, lty=1, lwd = 2, bty = "n", y.intersp= .3)
  plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
