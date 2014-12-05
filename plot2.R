#
# Function:     plot2
# Arguments:    a dataframe which includes data on individual household
#               electric power consumption from the UC Irvine Machine
#               Learning Repository
# Returns:      <null>
# Description:  Plots Global_active_power vs. Datetime, and exports the 
#               resulting graph to a png file called plot2.png
plot2 <- function(epc) {
    # Set row/columns to show just 1 graph
    par(mfrow=c(1,1))

    # Create the graph with labels
    with(epc, plot(Datetime, Global_active_power, type="l",
         xlab="", ylab="Global Active Power (kilowatts)",
         cex.axis=0.75, cex.lab=0.75))
    
    # Export graph to a png file
    dev.copy(png, file="plot2.png")
    dev.off()
}