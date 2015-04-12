
## load data from file, NA values encoded as ?
##
power_data <- read.csv2 (file = "Course Project 1/household_power_consumption.txt"
                         , dec ="."
                         , na.strings ="?")

## get rid of superfluous data
power_data <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

# convert date and time strings into one datetime object
power_data$DateTime = paste(power_data$Date, power_data$Time)
power_data$DateTime <- strptime(power_data$DateTime, format="%d/%m/%Y %H:%M:%S")

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

## Plot 2
## set current locate to US to get english Daynames
Sys.setlocale("LC_TIME", "US") # Windows

png ("plot2.png", width = 480, height = 480, units="px")

plot ( x = power_data$DateTime
       , y = power_data$Global_active_power
       , ylab =  "Global Active Power (kilowatts)"
       , xlab =""
       , type = "l")
dev.off()
