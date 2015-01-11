## R programming Coursera Exploratory Data Analysis - Week 1: Project 
## Gaurav Garg (gaurav_garg@yahoo.com)

## part 3 - Plot3.R
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
        png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
        plot(target.df$datetime, target.df$Sub_metering_1, type="n", xlab="",
             ylab="Energy sub metering", bg="transparent" )
        lines(target.df$datetime, target.df$Sub_metering_1, type="l",  col="black", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_2, type="l",  col="red", pch = 0 ) 
        lines(target.df$datetime, target.df$Sub_metering_3, type="l", col="blue", pch = 0 ) 
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
        dev.off()
        
