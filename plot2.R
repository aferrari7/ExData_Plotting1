#read in dataset and set as dataframe

my_data <- read.delim(file.choose(), sep=";")

conv <- as.data.frame(my_data)

#filter dataset and add columns

filt <- conv%>%
  select(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)%>%
  filter(Date == "1/2/2007" | Date == "2/2/2007" | (Date == "2/3/2007" & Time == "00:00:00"))

filt$day_of_week <- weekdays(as.Date(filt$Date),abbreviate=TRUE)
filt$date_time <- as.POSIXct(paste(as.Date(filt$Date), filt$Time), format="%Y-%m-%d %H:%M:%S", na.rm = TRUE)
filt$rnk <- NA

filt$rnk[order(filt$Date,filt$Time)] <- 1:nrow(filt)

#show line chart

png('plot2.png',width = 480, height = 480)

plot(filt$rnk,filt$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()