#Read the txt file
hpc<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
subsethpc<- subset(hpc, hpc$Date== "1/2/2007"| hpc$Date== "2/2/2007") #Create a date subset data frame
datetime<- strptime(paste(subsethpc$Date, subsethpc$Time, sep= " "), "%d/%m/%Y %H:%M:%S") #Merge date and time
globalactivepower<- as.numeric(subsethpc$Global_active_power) #Convertthe character variable to numeric
submet1<- as.numeric(subsethpc$Sub_metering_1)
submet2<- as.numeric(subsethpc$Sub_metering_2)
submet3<- as.numeric(subsethpc$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, submet1, type="l", ylab= "Energy Submetering",xlab= "")
lines(datetime, submet2, type= "l", col= "red")
lines(datetime, submet3, type= "l", col= "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty= 1, lwd=2.5, col= c("black", "red", "blue"))
dev.off()

