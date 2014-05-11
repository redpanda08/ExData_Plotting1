
##load the Electric power consumption dataset
test <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)

##convert variable types

test$Time <- strptime(paste(test$Date,test$Time),"%d/%m/%Y %H:%M:%S")

test$Date <- as.Date(test$Date,"%d/%m/%Y")

test[,3:9] <- sapply(test[,3:9],as.numeric)


##check column classes of the data frame test
lapply(test,class)

##subset the data to use
test2 <- test[test$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

##plot the histogram for Global_active_power variable
attach(test2)

png(file="plotmy.png",bg="transparent")
hist(Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")
dev.off()
