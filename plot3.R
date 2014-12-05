#
# Function:     plot3
# Arguments:    a dataframe which includes data on individual household
#               electric power consumption from the UC Irvine Machine
#               Learning Repository
# Returns:      <null>
# Description:  Plots all three sub metering measurements vs. 
#               Datetime, and exports the resulting graph to 
#               a png file called plot3.png
plot3 <- function(epc) {
    # Set row/columns to show just 1 graph
    par(mfrow=c(1,1))
    
    # Plot the first sub metering measurements vs Datetime
    plot(epc$Datetime,as.numeric(as.character(epc$Sub_metering_1)), 
         col="black", type="l", xlab="", ylab="Energy sub metering", 
         yaxp=c(0,30,3), ylim=c(0,40), cex.axis=0.75, cex.lab=0.75)
    
    # Add the other two sub metering measurements in red and blue
    lines(epc$Datetime,as.numeric(as.character(epc$Sub_metering_2)), 
          col="red")
    lines(epc$Datetime,as.numeric(as.character(epc$Sub_metering_3)), 
          col="blue")
    
    # Create a legend for the three sub metering measurements
    legend("topright", lwd=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           cex=.75)
    
    # Export graph to a png file
    dev.copy(png, file="plot3.png")
    dev.off()
}