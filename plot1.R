plot1 <- function() {

        x<- read.csv2('household_power_consumption.txt')
        
        DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
        DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
        
        x2 <- x[as.Date(x$Date,"%d/%m/%Y") >= DATE1 & as.Date(x$Date,"%d/%m/%Y") <= DATE2,]
        
        x2$Global_active_power<-as.numeric(as.character(x2$Global_active_power))
        
        par(mfrow=c(1,1))
        hist(x2$Global_active_power, col="red", bg="transparent", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        
        dev.copy(png, file = "plot1.png",width=504,height=504,units="px",bg = "transparent") ## Copy my plot to a PNG file
        dev.off()
}