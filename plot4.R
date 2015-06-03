plot4 <- function() {
        x<- read.csv2('household_power_consumption.txt')
        
        DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
        DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
        
        x2 <- x[as.Date(x$Date,"%d/%m/%Y") >= DATE1 & as.Date(x$Date,"%d/%m/%Y") <= DATE2,]
        
        x2$Global_active_power<-as.numeric(as.character(x2$Global_active_power))
        x2$Global_reactive_power<-as.numeric(as.character(x2$Global_reactive_power))
        x2$Voltage<-as.numeric(as.character(x2$Voltage))
        x2$Sub_metering_1<-as.numeric(as.character(x2$Sub_metering_1))
        x2$Sub_metering_2<-as.numeric(as.character(x2$Sub_metering_2))
        x2$Sub_metering_3<-as.numeric(as.character(x2$Sub_metering_3))
        x2$Date_Time<-paste(as.Date(x2$Date,"%d/%m/%Y"), x2$Time)
        
        par(mfrow=c(2,2))
        
        #plot 1
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Global_active_power, type="l", ylab="Global Active Power", xlab="", main="")
        
        #plot 2        
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Voltage, type="l", ylab="Voltage", xlab="datetime", main="")
        
        #plot 3
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", col="black")
        lines(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", main="", col="red")
        lines(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", main="", col="blue")
        legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), cex=0.75, bty="n")
        
        #plot 4       
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", main="")
        
        dev.copy(png, file = "plot4.png",width=504,height=504,units="px",bg = "transparent") 
        dev.off()
}