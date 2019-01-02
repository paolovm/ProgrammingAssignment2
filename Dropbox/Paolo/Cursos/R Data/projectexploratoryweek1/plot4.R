# read the dataset and subset
col_class_vector <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dataset <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, colClasses = col_class_vector , na.strings = "?")
dataset$Date <- as.Date( dataset$Date   , format="%d/%m/%Y")
dataset_period <- dataset [dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02" , ] 

# create additional field for date and time concatenation
dataset_period$datetime <- paste (dataset_period$Date,dataset_period$Time)
dataset_period$datetime<-as.POSIXlt(dataset_period$datetime)

# setup file device
png(file="plot4.png",width = 480, height = 480, units = "px")

# global param for multiple graphs in once screen
par(mfrow=c(2,2))

# First graph
plot( dataset_period$datetime , dataset_period$Global_active_power , type="o" , pch=26 , xlab="" , ylab= "Global Active Power")

# Second graph
plot( dataset_period$datetime , dataset_period$Voltage , type="o" , pch=26 , xlab="datetime" , ylab= "Voltage")

# Third graph
plot( x$datetime , x$Sub_metering_1 , type="n" ,xlab="" , ylab= "Energy sub metering")
lines(x$datetime ,x$Sub_metering_1 ,col="black")
lines(x$datetime ,x$Sub_metering_2 ,col="red")
lines(x$datetime ,x$Sub_metering_3 ,col="blue")
legend("topright",lty=1 , col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Fourth graph
plot( dataset_period$datetime , dataset_period$Global_reactive_power , type="o" , pch=26 , xlab="datetime" , ylab= "Global_reactive_power")

# turn off the device
dev.off() 

