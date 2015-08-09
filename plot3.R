## reading electric power household dataset directly from file
household.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
household.data$Date <- as.Date(household.data$Date, format = "%d/%m/%Y")

## subsetting the read data onto 2007-02-01 until 2007-02-02
selected.data <- household.data[which(household.data$Date >= "2007-02-01" & household.data$Date <= "2007-02-02"), ]

## Converting dates into date data type
datetime <- paste(selected.data$Date, selected.data$Time, sep=" ")
datetime <- as.POSIXlt(datetime, "UTC") 

## Plot the energy sub metering
par(mfrow = c(1,1))

with(selected.data, {
 plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
 lines(datetime, Sub_metering_2, col='Red')
 lines(datetime, Sub_metering_3, col='Blue')
 legend("topright", lty=1, lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, y.intersp = 0.3)
})
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



