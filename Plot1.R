## R programming Coursera Exploratory Data Analysis - Week 1: Project 
## Gaurav Garg (gaurav_garg@yahoo.com)

## part 1 - Plot1.R
        # set the working directory to the course directory
        setwd("../Exploratory Data Analysis")
        # read the file with header Note: ';' is the seperator and '?' is NA
        datafile <- "household_power_consumption.txt"
        df <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?", 
                       colClasses = c("Date",strptime,"numeric","numeric","numeric","numeric",
                                      "numeric","numeric","numeric"))
        # convert the first column of the data frame to Date (vs Fractor)
        df[,1] <- as.Date(df[,1])
        # subset the data frame for the target date range
        target.df <- subset(df, ((Date == as.Date("02/01/2007")) | (Date == as.Date("02/02/2007"))))
        # setup the histogram and plot it in the file
        png(filename = "plot1.png", width = 480, height = 480, units = "px", background = "transparent")
        hist(target.df$Global_active_power, col="red", main ="Global Active Power", 
             xlab ="Global Active Power (kilowatts)" )
        dev.off()
        
