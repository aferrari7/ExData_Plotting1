#read in dataset and set as dataframe

my_data <- read.delim(file.choose(), sep=";")

conv <- as.data.frame(my_data)

#filter dataset

filt <- conv%>%
  select(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)%>%
  filter(Date == "1/2/2007" | Date == "2/2/2007" | (Date == "2/3/2007" & Time == "00:00:00"))

#show histogram

png('plot1.png',width = 480, height = 480)

hist(as.numeric(filt$Global_active_power),col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()