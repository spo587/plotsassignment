source('plot3.R')

png('plot4.png')

## add column and row
par(mfcol=c(2,2))

## add plots one at a time
makePlot2()

## make plot 3 (same as before, but second one on our new plot) with no legend border
makePlot3(FALSE)

## add the two other plots for the second column

with(bothDays, plot(minutes, Voltage, type='n', xaxt='n', xlab='datetime'))
lines(bothDays$minutes, bothDays$Voltage, col='black')
labelxaxis()

with(bothDays, plot(minutes, Global_reactive_power, type='n', xaxt='n', xlab='datetime'))
lines(bothDays$minutes, bothDays$Global_reactive_power, col='black')
labelxaxis()

dev.off()