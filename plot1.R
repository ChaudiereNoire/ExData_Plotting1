plot1 <- function() {
  ## This is my second pass at the course.  Last time, I could not figure out why I got a value of 
  ## 3,000 for the kilowatt consumption here and the plot were were supposed to reach got up to 6.
  ##
  ## I researched on the web and found a web page at 
  ## http://rstudio-pubs-static.s3.amazonaws.com/19163_76f1855972154fac8b8846373c236cd0.html
  ## which showed me that my import process had introduced a bad column of data.  I switched from read.csv 
  ## to read.table and my problems cleared up.  I was able to redo my original functions for printing
  ## and now they came up clean.
  ##
  household_power_consumption <- read.table("~/R/eda/household_power_consumption.txt", sep=";",header=T,na.strings="?")
  household_power_consumption$Datetime <- strptime(paste(household_power_consumption$Date, 
                                                         household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
  ## household_power_consumption$Global_active_power[household_power_consumption$Global_active_power == "?"] <- NA
  ## use only data from the 1st and 2nd of February, 2007
  plot_data <- household_power_consumption[which(household_power_consumption$Date == "2007-02-01" 
                                                 | household_power_consumption$Date == "2007-02-02"),]
  
  png(file="plot1.png")
  hist(plot_data$Global_active_power, breaks=13, col="red", 
       main="Global Active Power", 
       ylab = "Frequency", xlab = "Global Active Power (Kilowatts)",
       ylim=c(0,1200), xlim = c(0,6), xaxp = c(0,6,3))
  dev.off()
  
}