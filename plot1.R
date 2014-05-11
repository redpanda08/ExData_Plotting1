
##check column classes of the data frame test
lapply(test,class)

##subset the data to use
test2 <- test[test$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

##plot the histogram for Global_active_power variable and save it as a png file
attach(test2)

png(file="plotmy.png",bg="transparent")
hist(Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")
dev.off()