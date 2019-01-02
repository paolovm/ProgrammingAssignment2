# read the dataset and subset
col_class_vector <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dataset <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, colClasses = col_class_vector , na.strings = "?")
dataset$Date <- as.Date( dataset$Date   , format="%d/%m/%Y")
dataset_period <- dataset [dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02" , ] 

# create additional field for date and time concatenation
dataset_period$datetime <- paste (dataset_period$Date,dataset_period$Time)
dataset_period$datetime<-as.POSIXlt(dataset_period$datetime)

# setup file device
png(file="plot2.png",width = 480, height = 480, units = "px")

# plot graph
plot( dataset_period$datetime , dataset_period$Global_active_power , type="o" , pch=26 , xlab="" , ylab= "Global Active Power  (kilowatts)")

# turn off device
dev.off() 

