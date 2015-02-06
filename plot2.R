source('plot1.R')

library(chron)

## split the data into thursday and friday, two separate data frames
day1 <- subset(twoDays, julian==0)
day2 <- subset(twoDays, julian==1)

## add a minutes from thursday midnight column to each data frame,
## converting/re-formatting from the Time column of each
day1$minutes <- as.numeric(chron(times.=day1$Time))*1440

## the friday minutes are in minutes from midnight friday, so add 1440 for
## the extra day
day2$minutes <- as.numeric(chron(times.=day2$Time))*1440 + 1440

## put back together into a single data frame
bothDays <- rbind(day1, day2)

## helper function for x axis labeling, will use again later
## need to add ticks in the right place and label the ticks
labelxaxis <- function(){
    ticks <- c(0,1440,2880)
    axis(side=1, at=ticks, labels=c('Thu','Fri','Sat'))
}

## make plot 2 function

makePlot2 <- function(){
    with(bothDays, plot(minutes, Global_active_power, type='n', xaxt='n', xlab='',
                        ylab='Global Active Power (kilowatts)'))
    ## connect the dots with lines function
    lines(bothDays$minutes, bothDays$Global_active_power)
    labelxaxis()
}

png('plot2.png')
makePlot2()
dev.off()