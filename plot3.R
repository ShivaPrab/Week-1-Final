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

png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

with(data_range, {
  plot(datetime, Sub_metering_1
               , type = "n"
               , ylab = "Energy sub metering"
               , xlab = "")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})

legend(
  x = "topright"
  , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  , col = c("black", "red", "blue")
)

# BE SURE TO TURN OFF DEVICE 
dev.off()