#
# Function:     ReadEnergyData
# Arguments:    <none>
# Returns:      a clean data frame with the data we need for our plots
# Description:  read the data in from the file, convert the Date field
#               to a date, convert the numeric fields from factors, and
#               restrict the data to the 2 dates in which we are inter-
#               ested.
ReadEnergyData <- function() {
    # Make sure the data file can be found.  Otherwise, puke and die.
    if (!file.exists("household_power_consumption.txt"))
        stop("file \"household_power_consumption.txt\" not found")

    # Read the data in from the file
    epc <- read.table("household_power_consumption.txt", 
                      header=T, sep=";", stringsAsFactors=F)
    
    # Convert the Date field to a date, and create the Datetime field
    epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
    epc$Datetime <- strptime(paste(epc$Date, epc$Time," "),
                             "%Y-%m-%d %H:%M:%S")
    
    # Restrict the data to only the two dates in which we are interested
    epc <- epc[(epc$Date == as.Date("2007-02-01", "%Y-%m-%d")) | 
               (epc$Date == as.Date("2007-02-02", "%Y-%m-%d")),]
    
    # The numeric fields need to be converted to numerics
    epc$Global_active_power <- as.numeric(epc$Global_active_power)
    epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
    epc$Voltage <- as.numeric(epc$Voltage)
    epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
    epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
    epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
    
    epc
}

#
# Function:     plot1
# Arguments:    a dataframe which includes data on individual household
#               electric power consumption from the UC Irvine Machine
#               Learning Repository
# Returns:      <null>
# Description:  Plots Global_active_power vs. Datetime, and exports the 
#               resulting graph to a png file called plot1.png
plot1 <- function(epc) {
    # Set row/columns to show just 1 graph
    par(mfrow=c(1,1))
    
    # Create the histogram, with labels and formatting
    with(epc, hist(Global_active_power, 
                   xlab="Global Active Power (kilowatts)", 
                   main="Global Active Power", col="red", 
                   cex.lab=.75, cex.axis=0.75, cex.main=.85))
    
    # Export graph to a png file
    dev.copy(png, file="plot1.png")
    dev.off()
}