## R programming Coursera Exploratory Data Analysis - Week 1: Project 
## Gaurav Garg (gaurav_garg@yahoo.com)

## part 2 - Plot2.R
        # set the working directory to the course directory
        setwd("../Exploratory Data Analysis/ExData_Plotting1")
        # read the file with header Note: ';' is the seperator and '?' is NA
        datafile <- "household_power_consumption.txt"
        df <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?")
        # add a column merging the date and time columns 
        df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S") 
        # subset the data frame for the target date range
        target.df <- subset(df, (datetime >= "2007-02-01 00:00:00" & datetime <="2007-02-02 23:59:59"))
        # setup the histogram and plot it in the file
        png(filename = "./figure/plot2.png", width = 480, height = 480, units = "px", bg="transparent")
        plot(target.df$datetime, target.df$Global_active_power, type="l", xlab="",
             ylab="Global Active Power (kilowatts)", bg="transparent" )
        lines(target.df$datetime, target.df$Global_active_power, type="l",  col="black", pch = 0 ) 
        dev.off()
        
