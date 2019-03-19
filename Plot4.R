library(dplyr)
library(lubridate)

df <- read.table('household_power_consumption.txt', 
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE, 
                 na.strings = '?')
df$Date <- dmy(df$Date)
df <- filter(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

png('Plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

with(df, plot(Global_active_power, type = 'l',
              xlab = '', xaxt = 'n',
              ylab = 'Global Active Power'))
axis(1, c(1,1450,2800), c('Thu', 'Fri', 'Sat'))

with(df, plot(Voltage, type = 'l',
              xlab = 'datetime', xaxt = 'n',
              ylab = 'Voltage'))
axis(1, c(1,1450,2800), c('Thu', 'Fri', 'Sat'))

with(df, plot(Sub_metering_1, type = 'l',
              xlab = '', xaxt = 'n',
              ylab = 'Energy Sub metering'))
with(df, lines(Sub_metering_2, type = 'l', col = 'red'))
with(df, lines(Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1)
axis(1, c(1,1450,2800), c('Thu', 'Fri', 'Sat'))

with(df, plot(Global_reactive_power, type = 'l',
              xlab = 'Global_reactive_power', xaxt = 'n',
              ylab = 'Voltage'))
axis(1, c(1,1450,2800), c('Thu', 'Fri', 'Sat'))

dev.off()
