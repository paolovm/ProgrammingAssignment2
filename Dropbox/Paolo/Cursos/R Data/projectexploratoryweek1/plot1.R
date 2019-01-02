col_class_vector <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dataset <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, colClasses = col_class_vector , na.strings = "?")
dataset$Date <- as.Date( dataset$Date   , format="%d/%m/%Y")
dataset_period <- dataset [dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02" , ] 
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(dataset_period$Global_active_power,col="red" , xlab="Global Active Power (kilowatts)" , main="Global Active Power")
dev.off() 

