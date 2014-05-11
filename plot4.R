
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

##plot four graphs on one page
png(file="plot4.png",bg="transparent")

attach(test2)

par(mfrow=c(2,2))

## plot (1,1)
plot(Time,Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

## plot (1,2)
plot(Time,Voltage,type="l",
     xlab="datetime",ylab="Voltage")

## plot(2,1)
plot(Time,Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(Time,Sub_metering_2,col="red")
lines(Time,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                       "Sub_metering_2",
                                                       "Sub_metering_3"),
       lwd=1.5,bty="n")

## plot(2,2)
plot(Time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()




