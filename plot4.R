#Read the txt file
hpc<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
subsethpc<- subset(hpc, hpc$Date== "1/2/2007"| hpc$Date== "2/2/2007") #Create a date subset data frame
datetime<- strptime(paste(subsethpc$Date, subsethpc$Time, sep= " "), "%d/%m/%Y %H:%M:%S") #Merge date and time
globalactivepower<- as.numeric(subsethpc$Global_active_power)#Convert the character variable to numeric
voltage<- as.numeric(subsethpc$Voltage)
globalreactivepower<- as.numeric(subsethpc$Global_reactive_power)
submet1<- as.numeric(subsethpc$Sub_metering_1)
submet2<- as.numeric(subsethpc$Sub_metering_2)
submet3<- as.numeric(subsethpc$Sub_metering_3)
png("plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
plot(datetime, globalactivepower, type= "l", xlab= "", ylab= "Global Active power", cex= 0.2)
plot(datetime, voltage, type= "l", xlab= "datetime", ylab= "Voltage")
plot(datetime, submet1, type="l", ylab= "Energy Submetering",xlab= "")
lines(datetime, submet2, type= "l", col= "red")
lines(datetime, submet3, type= "l", col= "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty= 1, lwd=2.5, col= c("black", "red", "blue"))
plot(datetime, globalreactivepower, type= "l", xlab= "datetime", ylab= "Global_Reactive_Power")
dev.off()

