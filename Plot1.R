#Read the txt file
hpc<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
subsethpc<- subset(hpc, hpc$Date== "1/2/2007"| hpc$Date== "2/2/2007") #Create a date subset data frame
globalactivepower<- as.numeric(subsethpc$Global_active_power) #Conver the character variable to numeric
png("plot1.png", width=480, height=480) #Create the plot
hist(globalactivepower, col= "red", xlab= "Global Active Power (Kilowatts)", main= "Global Active Power")
dev.off()