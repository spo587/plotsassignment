

## function to read in only the relevant rows of the data and return a data frame
prepareData <- function(){
    hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                      skip=66637, nrows=2880, stringsAsFactors=FALSE)
    ## separately read in just the first row to get the column names
    hpcNames <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                           nrows=1)
    ## re-name the column names of the hpc data frame, the one we want
    names(hpc) <- names(hpcNames)
    ## convert dates to Date objects
    hpc$Date <- as.Date(hpc$Date, format = '%d/%m/%Y')
    ## make into julian dates from the day we want
    hpc$julian <- julian(hpc$Date, origin = as.Date('2007-02-01'))
    ## convert global_active_power, reactive and Voltage columns to numeric
    twoDays$Global_active_power <- as.numeric(twoDays$Global_active_power)
    bothDays$Voltage <- as.numeric(bothDays$Voltage)
    bothDays$Global_reactive_power <- as.numeric(bothDays$Global_reactive_power)
    twoDays
} 

## store data in twoDays data frame
twoDays <- prepareData()

## plot 1

png('plot1.png')
hist(twoDays$Global_active_power, col='red', xlab='Global active power (kilowatts)')
dev.off()

