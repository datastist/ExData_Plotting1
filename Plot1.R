library(dplyr)
library(lubridate)

df <- read.table('household_power_consumption.txt', 
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE, 
                 na.strings = '?')

df$Date <- dmy(df$Date)
df <- filter(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

png('Plot1.png', width = 480, height = 480)
with(df, hist(Global_active_power, col = 'red', 
              main = 'Global Active Power', 
              xlab = 'Global Active Power(kilowatts)'))
dev.off()