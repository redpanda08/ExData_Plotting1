
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

##plot the line graph for Energy sub metering
attach(test2)

png(file="plot3.png",bg="transparent")
plot(Time,Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(Time,Sub_metering_2,col="red")
lines(Time,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                       "Sub_metering_2",
                                                       "Sub_metering_3"),
                                                        lwd=1.5,
                                                       border="black")
dev.off()