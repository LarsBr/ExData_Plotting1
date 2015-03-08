
## load data from file, NA values encoded as ?
##
power_data <- read.csv2 (file = "Course Project 1/household_power_consumption.txt"
                         , dec ="."
                         , na.strings ="?")

library (dplyr)
## get rid of superfluous data
power_data <- filter(power_data, Date=="2/1/2007" | Date=="2/2/2007")

# global_active_power to numeric -> maybe set this as column class during loading?
# power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

###For each plot you should
#
# Construct the plot and save it to a PNG file with a width of 480 pixels
#and a height of 480 pixels.
#
# Name each of the plot files as plot1.png, plot2.png, etc.
#
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.
#
# Add the PNG file and R code file to your git repository

png ("plot1.png", width = 480, height = 480, units="px")

hist (x = as.numeric(power_data$Global_active_power), col = "red"
                , main = "Global Active Power"
                , xlab = "Global Active Power (kilowatts)"
                , ylab = "Frequency"                )
dev.off()

