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



#run all 4 statements below together, puts all on same page

png('plot4.png',width = 480, height = 480)

par(mfrow=c(2,2))

plot(filt$Global_active_power ~ filt$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(filt$Voltage ~ filt$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(filt$Sub_metering_1 ~ filt$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
lines(filt$Sub_metering_2 ~ filt$datetime,col="red")
lines(filt$Sub_metering_3 ~ filt$datetime,col="Blue")

plot(filt$Global_reactive_power ~ filt$datetime,type="l",ylab="Global_reactive_power",xlab="")

dev.off()
