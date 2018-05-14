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


#show line chart

par(mfrow=c(1,1))

png('plot2.png',width = 480, height = 480)

plot(filt$Global_active_power ~ filt$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
