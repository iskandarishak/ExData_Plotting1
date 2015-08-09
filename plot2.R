## reading electric power consumption dataset directly from file
household.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
household.data$Date <- as.Date(household.data$Date, format = "%d/%m/%Y")

## subsetting the read data onto 2007-02-01 until 2007-02-02
selected.data <- household.data[which(consumption.data$Date >= "2007-02-01" & consumption.data$Date <= "2007-02-02"), ]

## Converting dates into date data type
datetime <- paste(selected.data$Date, selected.data$Time, sep=" ")
datetime <- as.POSIXlt(datetime, "UTC") 

## Plot the global active power against date time using low density line graph
plot(datetime, selected.data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving the plot image in png form
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
