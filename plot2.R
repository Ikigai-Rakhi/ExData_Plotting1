#Read the txt file
hpc<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
subsethpc<- subset(hpc, hpc$Date== "1/2/2007"| hpc$Date== "2/2/2007") #Create a date subset data frame
datetime<- strptime(paste(subsethpc$Date, subsethpc$Time, sep= " "), "%d/%m/%Y %H:%M:%S") #Merge date and time
globalactivepower<- as.numeric(subsethpc$Global_active_power) #Change character variabel to numeric
png("plot2.png", width= 480, height= 480)
plot(datetime, globalactivepower, type= "l", xlab= "", ylab= "Global Active Power (Kilowatts)")
dev.off()

