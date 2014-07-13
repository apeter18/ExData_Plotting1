# Read data from unziped file
data<-read.table("household_power_consumption.txt",header=T, sep=';',
                 na.strings=c("",NA,"?"),stringsAsFactors=F)
# Limit data to the data from Feb. 1&2, 2007
datagood<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
# Convert date and time into a single column for date and time
dt <- paste(datagood$Date,datagood$Time)
makedt  <- strptime(dt,"%d/%m/%Y %H:%M:%S")
datagood$datetime  <- makedt

# Create the png file
png("plot4.png",width=480,height=480,units='px')
# Split the graphic into four parts
par(mfrow=c(2,2))

# Create the first graph
with(datagood,plot(datetime,Global_active_power,xlab="",
                   ylab="Global Active Power (kilowatts)",type="n"))
# Add data to the graph
with(datagood,lines(datetime,Global_active_power))

# Create the second graph
with(datagood,plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="n"))
# Add data to the graph
with(datagood,lines(datetime,Voltage))

# Create the third graph
with(datagood,plot(datetime,Sub_metering_1,xlab="",
                   ylab="Energy sub metering",type="n"))
# Add data to the graph
with(datagood,{lines(datetime,Sub_metering_1)
               lines(datetime,Sub_metering_2,col="red")
               lines(datetime,Sub_metering_3,col="blue")})
# Add the legend
legend("topright",lty="solid",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

# Create the fourth graph
with(datagood,plot(datetime,Global_reactive_power,xlab="datetime",
                   ylab="Global_reactive_power",type="l"))
# Add data to the graph
with(datagood,lines(datetime,Global_reactive_power))
dev.off()