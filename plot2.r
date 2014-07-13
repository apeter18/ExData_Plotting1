# Read data from unziped file
data<-read.table("household_power_consumption.txt",header=T, sep=';',
                 na.strings=c("",NA,"?"),stringsAsFactors=F)
# Limit data to the data from Feb. 1&2, 2007
datagood<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
# Convert date and time into a single column for date and time
dt <- paste(datagood$Date,datagood$Time)
makedt  <- strptime(dt,"%d/%m/%Y %H:%M:%S")
datagood$datetime  <- makedt
# Create the graph
with(datagood,plot(datetime,Global_active_power,xlab="",
                   ylab="Global Active Power (kilowatts)",type="n"))
# Add data to the graph
with(datagood,lines(datetime,Global_active_power))
# Save the graph
dev.copy(png,file="plot2.png",width=480,height=480,units='px')
dev.off()