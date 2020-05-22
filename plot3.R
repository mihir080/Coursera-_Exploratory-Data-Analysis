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

png("plot3.png", width = 480, height = 480, units = "px")
plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0,40))
lines(datetime, as.numeric(as.character(Sub_metering_2)), col = "red")
lines(datetime, as.numeric(as.character(Sub_metering_3)), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
