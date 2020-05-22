##Reading the data into R
power <- read.table("consumption.txt", header = TRUE, sep = ";")

## subsetting the data required 

power2 <- power[as.character(power$Date) %in% c("1/2/2007", "2/2/2007"), ]

## Join the date and time variables of the data 

power2$datetime <- paste(power2$Date, power2$Time)

## converting date time to required format 

power2$datetime <- strptime(power2$datetime, "%d/%m/%Y %H:%M:%S")
attach(power2)

##Creating the required png file 

png("plot2.png", width = 480, height = 480, units = "px")

##plotting Global Active Power Min by Min

plot(datetime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()