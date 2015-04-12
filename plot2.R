##read the text file, using the na.string to substitute the "?"
mydata = read.table("household_power_consumption.txt",sep =";",header = TRUE,na.string ="?")
##create data set with first date
my_data_20070201 <- subset(mydata, as.Date(mydata$Date, format="%d/%m/%Y") == as.Date("1/2/2007",format="%d/%m/%Y"))
##create data set with second date
my_data_20070202 <- subset(mydata, as.Date(mydata$Date, format="%d/%m/%Y") == as.Date("2/2/2007",format="%d/%m/%Y"))
##combine the data frames using rbind.
data <- rbind(my_data_20070201,my_data_20070202)
##combining date time to format is as per the format in graph
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
