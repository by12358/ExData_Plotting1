#
# Function:     plot4
# Arguments:    a dataframe which includes data on individual household
#               electric power consumption from the UC Irvine Machine
#               Learning Repository
# Returns:      <null>
# Description:  Creates a 2x2 grid of graphs on one device, including
#               1. Global active power vs. Datetime
#               2. Voltage vs. Datetime
#               3. The sub metering measurements vs. Datetime, and
#               4. Global reactive power vs. Datetime
#               Finally, it exports the resulting graph to a png 
#               file called plot4.png
plot4 <- function(epc) {
    # Set plot grid for a 2x2 grid of graphs
    par(mfrow=c(2,2))

    # First graph, global active power vs. datetime
    with(epc, plot(Datetime, Global_active_power, type="l",
                   xlab="", ylab="Global Active Power (kilowatts)",
                   cex.axis=0.75, cex.lab=0.75))
    
    # Second graph, voltage vs. datetime
    with(epc, plot(Datetime, Voltage, type="l", xlab="datetime",
                   ylab="Voltage", cex.axis=0.75, cex.lab=0.75))
    
    # Third graph, 3 sub meterings vs datetime, with legend
    plot(epc$Datetime,as.numeric(as.character(epc$Sub_metering_1)), 
         col="black", type="l", xlab="", ylab="Energy sub metering", 
         yaxp=c(0,30,3), ylim=c(0,40), cex.axis=0.75, cex.lab=0.75)
    lines(epc$Datetime,as.numeric(as.character(epc$Sub_metering_2)), 
          col="red")
    lines(epc$Datetime,as.numeric(as.character(epc$Sub_metering_3)), 
          col="blue")
    legend("topright", lwd=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           cex=.5, bty="n")
    
    # Fourth graph, global reactive power vs datetime
    with(epc, plot(Datetime, Global_reactive_power, type="l",
                   xlab="datetime", ylab="Global_reactive_power",
                   cex.axis=0.65, cex.lab=0.75), yaxp=c(0,0.5,5))
    
    # Export graphs to a png file
    dev.copy(png, file="plot4.png")
    dev.off()
}