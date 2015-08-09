## reading electric power consumption dataset directly from file
household.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
household.data$Date <- as.Date(household.data$Date, format = "%d/%m/%Y")

## subsetting the read data onto 2007-02-01 until 2007-02-02
selected.data <- household.data[which(household.data$Date >= "2007-02-01" & household.data$Date <= "2007-02-02"), ]

## Plot histogram for global active power with red color column
hist(selected.data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the plot image in png form
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
