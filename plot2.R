plot2 <- function() {
        x<- read.csv2('household_power_consumption.txt')
        
        DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
        DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
        
        x2 <- x[as.Date(x$Date,"%d/%m/%Y") >= DATE1 & as.Date(x$Date,"%d/%m/%Y") <= DATE2,]
        
        x2$Global_active_power<-as.numeric(as.character(x2$Global_active_power))
        x2$Date_Time<-paste(as.Date(x2$Date,"%d/%m/%Y"), x2$Time)
        
        par(mfrow=c(1,1))
        plot(strptime(x2$Date_Time, format="%Y-%m-%d %H:%M:%S"),x2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")
        
        dev.copy(png, file = "plot2.png",width=504,height=504,units="px",bg = "transparent") ## Copy my plot to a PNG file
        dev.off()
}