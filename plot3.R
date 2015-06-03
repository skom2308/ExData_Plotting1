plot3 <- function() {
        x<- read.csv2('household_power_consumption.txt')
        
        DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
        DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
        
        x2 <- x[as.Date(x$Date,"%d/%m/%Y") >= DATE1 & as.Date(x$Date,"%d/%m/%Y") <= DATE2,]
        
        x2$Sub_metering_1<-as.numeric(as.character(x2$Sub_metering_1))
        x2$Sub_metering_2<-as.numeric(as.character(x2$Sub_metering_2))
        x2$Sub_metering_3<-as.numeric(as.character(x2$Sub_metering_3))
        x2$Date_Time<-paste(as.Date(x2$Date,"%d/%m/%Y"), x2$Time)
        
        par(mfrow=c(1,1))
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", col="black")
        lines(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", main="", col="red")
        lines(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", main="", col="blue")
        legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), cex=0.75)
        
        dev.copy(png, file = "plot3.png",width=504,height=504,units="px",bg = "transparent") 
        dev.off()
}