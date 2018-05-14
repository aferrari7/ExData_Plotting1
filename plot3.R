#read in dataset

my_data <- read.csv("D:\\r\\household_power_consumption.txt", header = T, sep = ';', 
           na.strings = "?", nrows = 2075259, check.names = F, 
           stringsAsFactors = F, comment.char = "", quote = '\"')


#convert date and filter dataset
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")


filt <- my_data%>%
  select(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)%>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")


date_time <- paste(as.Date(filt$Date), filt$Time)
filt$datetime <- as.POSIXct(date_time)


#show line chart (run all 4 lines together)

png('plot3.png',width = 480, height = 480)

plot(filt$Sub_metering_1 ~ filt$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
lines(filt$Sub_metering_2 ~ filt$datetime,col="red")
lines(filt$Sub_metering_3 ~ filt$datetime,col="Blue")
legend("topright",pch=1,col=c("black","red", "blue"), lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()