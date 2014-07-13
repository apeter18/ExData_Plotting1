# Read data from unziped file
data<-read.table("household_power_consumption.txt",header=T, sep=';',
                     ,stringsAsFactors=F)
# Limit data to the data from Feb. 1&2, 2007
datagood<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
# Convert data for the Global Active Power to numeric form, as a new vector
globalactive<-as.numeric(datagood$Global_active_power)
# Create and Display Histogram for Global Active Power
with(hist(globalactive,main="Global Acitve Power",
          xlab="Global Active Power (kilowatts)",col="red")) 
# Copy to a png file, with desired specifications
dev.copy(png,file="plot1.png",width=480,height=480,units='px')
dev.off()