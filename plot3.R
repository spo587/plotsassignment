
source('plot2.R')

## plot 3 function
makePlot3 <- function(legendBorderOrNot) {
    with(bothDays, plot(minutes, Sub_metering_1, type='n', xaxt='n',
                        xlab='', ylab='Energy sub metering'))
    ## connect the dots of each separately
    lines(bothDays$minutes, bothDays$Sub_metering_1, col='black') 
    lines(bothDays$minutes, bothDays$Sub_metering_2, col='red')
    lines(bothDays$minutes, bothDays$Sub_metering_3, col='blue')
    labelxaxis()
    ## add legend, border controlled by legendBorderOrNot parameter input
    if(legendBorderOrNot == TRUE){
        legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           lty=1, col=c('black', 'red', 'blue'), cex=0.8, xjust=1, yjust=1)
    }
    else {
        legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
               lty=1, col=c('black', 'red', 'blue'), cex=0.8, xjust=1, yjust=1, bty='n')
    }
    ##axis(side=1, at=ticks, labels=c('Thu', 'Fri', 'Sat'))
}

## make the plot

png('plot3.png')
makePlot3(TRUE)
dev.off()