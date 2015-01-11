## R programming Coursera Exploratory Data Analysis - Week 1: Project 
## Gaurav Garg (gaurav_garg@yahoo.com)

## part 4 - Plot4.R
        # set the working directory to the course directory
        setwd("../Exploratory Data Analysis/ExData_Plotting1")
        # read the file with header Note: ';' is the seperator and '?' is NA
        datafile <- "household_power_consumption.txt"
        df <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?")
      
        # add a column merging the date and time columns 
        df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S") 
        # subset the data frame for the target date range
        target.df <- subset(df, (datetime >= "2007-02-01 00:00:00" & datetime <="2007-02-02 23:59:59"))
        xRange <- range(target.df$datetime)
        yRange <- (target.df$Sub_metering_1)
        
        # setup the histogram and plot it in the file
        png(filename = "plot4.png",  bg = "transparent")
        par(mfrow=c(2,2))
        
        #plot 1: 
        plot(target.df$datetime, target.df$Global_active_power, type="l", xlab="",
                ylab="Global Active Power (kilowatts)", bg="transparent" )

        
        #plot 2:
        plot(target.df$datetime, target.df$Voltage, type = "l", xlab="datetime", 
             ylab="Voltage", col = "black")
        
        #plot 3:
        plot(target.df$datetime, target.df$Sub_metering_1, type="n", xlab="",
             ylab="Energy sub metering", bg="transparent" )
        lines(target.df$datetime, target.df$Sub_metering_1, type="l",  col="black", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_2, type="l",  col="red", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_3, type="l", col="blue", pch = 0 ) 
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, col=c("black","red","blue"))
        
        #plot 4:
        plot(target.df$datetime, target.df$Global_reactive_power, type = "l", col = "black",
             xlab="datetime", ylab="Global_reactive_power")
        
        #write the file and close the device
        dev.off()
        
