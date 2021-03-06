
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

## set current locate to US to get english Daynames
Sys.setlocale("LC_TIME", "US") # Windows

## Plot 4
png ("plot4.png", width = 480, height = 480, units="px")

par(mfrow=c(2,2))

plot(power_data$DateTime, power_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")
plot(power_data$DateTime, power_data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
plot(power_data$DateTime, power_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(power_data$DateTime, power_data$Sub_metering_2, col="red")
lines(power_data$DateTime, power_data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1,
       col=c("black", "red", "blue"), bty="n")

plot(power_data$DateTime, power_data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()