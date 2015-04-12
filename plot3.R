##read the text file, using the na.string to substitute the "?"
mydata = read.table("household_power_consumption.txt",sep =";",header = TRUE,na.string ="?")
##create data set with first date
my_data_20070201 <- subset(mydata, as.Date(mydata$Date, format="%d/%m/%Y") == as.Date("1/2/2007",format="%d/%m/%Y"))
##create data set with second date
my_data_20070202 <- subset(mydata, as.Date(mydata$Date, format="%d/%m/%Y") == as.Date("2/2/2007",format="%d/%m/%Y"))
##combine the data frames using rbind.
data <- rbind(my_data_20070201,my_data_20070202)
##combining date time to format is as per the format in graph
png("plot3.png", width=480, height=480) 
plot(datetime, as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, as.numeric(data$Sub_metering_2), type="l", col="red") 
lines(datetime, as.numeric(data$Sub_metering_3), type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 
