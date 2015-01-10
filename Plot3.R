## R programming Coursera Exploratory Data Analysis - Week 1: Project 
## Gaurav Garg (gaurav_garg@yahoo.com)

## part 3 - Plot3.R
        # set the working directory to the course directory
        setwd("../Exploratory Data Analysis")
        # read the file with header Note: ';' is the seperator and '?' is NA
        datafile <- "household_power_consumption.txt"
        df <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?")
      
       # df <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?", 
       #                colClasses = c("Date","character","numeric","numeric","numeric","numeric",
       #                               "numeric","numeric","numeric"))
        # convert the first column of the data frame to Date (vs Fractor)
        #df[,1] <- as.Date(df[,1])
        df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S") 
        # subset the data frame for the target date range
        target.df <- subset(df, (datetime >= "2007-02-01 00:00:00" & datetime <="2007-02-02 23:59:59"))
        xRange <- range(target.df$datetime)
        yRange <- (target.df$Sub_metering_1)
        
        # setup the histogram and plot it in the file
        png(filename = "plot3.png", width = 480, height = 480, units = "px")
        plot(target.df$datetime, target.df$Sub_metering_1, type="n", xlab="",
             ylab="Energy sub metering" )
        lines(target.df$datetime, target.df$Sub_metering_1, type="l",  col="black", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_2, type="l",  col="red", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_3, type="l", col="blue", pch = 0 ) 
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
        dev.off()
        
