##Reading the data into R
power <- read.table("consumption.txt", header = TRUE, sep = ";")

## subsetting the data required 

power2 <- power[as.character(power$Date) %in% c("1/2/2007", "2/2/2007"), ]

## Join the date and time variables of the data 

power2$datetime <- paste(power2$Date, power2$Time)

## converting date time to required format 

power2$datetime <- strptime(power2$datetime, "%d/%m/%Y %H:%M:%S")
attach(power2)

##opening required png file 

png("plot4.png", width = 480, height = 480, units = "px")

##setting the plot area
par(mfrow=c(2,2))

##Plotting the graph at 1,1

plot(datetime, as.numeric(as.character(Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")

##Plotting graph at 1, 2

plot(datetime, as.numeric(as.character(Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")

##plotting graph at 2, 1

plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0,40))
lines(datetime, as.numeric(as.character(Sub_metering_2)), col = "red")
lines(datetime, as.numeric(as.character(Sub_metering_3)), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plotting grpah at 2, 2

plot(datetime, as.numeric(as.character(Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()