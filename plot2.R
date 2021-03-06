plot2 <- function() {
  household_power_consumption <- read.table("~/R/eda/household_power_consumption.txt", sep=";",header=T,na.strings="?")
  household_power_consumption$Datetime <- strptime(paste(household_power_consumption$Date, 
                                                         household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
  ## household_power_consumption$Global_active_power[household_power_consumption$Global_active_power == "?"] <- NA
  ## use only data from the 1st and 2nd of February, 2007
  plot_data <- household_power_consumption[which(household_power_consumption$Date == "2007-02-01" 
                                                 | household_power_consumption$Date == "2007-02-02"),]
  
  png(file="plot2.png")
  plot(plot_data$Datetime, plot_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}