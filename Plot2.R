#I like always starting with a clean environment 
rm(list = ls())
 
setwd("C:/Users/shiva/Desktop/coding/R/Exploratory Data Analysis/Week 1 Final") 

#Read in Data from WD 
data <- read.csv("household_power_consumption.txt"
                , header = TRUE
                , sep = ";"
                , na.strings = "?"
                , as.is = TRUE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset for the required 2 days, alternatively you can subset earlier since these
#are the only dates we will work with for now 
data_range <- subset(data, Date == as.Date("2007-02-01") | 
                           Date == as.Date("2007-02-02"))

data_range$datetime <- as.POSIXct(paste(data_range$Date, data_range$Time), 
                                  format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480, units="px", bg="transparent")
with (data_range, {
      plot(datetime
           , Global_active_power
           , type="n"
           , ylab="Global Average Power (kilowatts)"
           , xlab="")

lines(datetime,Global_active_power)
})

# BE SURE TO TURN OFF DEVICE 
dev.off()