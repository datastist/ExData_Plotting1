library(dplyr)
library(lubridate)

df <- read.table('household_power_consumption.txt', 
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE, 
                 na.strings = '?')

df$Date <- dmy(df$Date)
df <- filter(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

png('Plot2.png', width = 480, height = 480)
with(df, plot(Global_active_power, type = 'l',
              xlab = '', xaxt = 'n',
              ylab = 'Global Active Power (kilowatts)'))
axis(1, c(1,1450,2800), c('Thu', 'Fri', 'Sat'))
dev.off()