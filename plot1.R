powerdata <- read.table('household_power_consumption.txt',header=T,sep=';',
        colClasses = c('character','character','numeric','numeric','numeric',
        'numeric','numeric','numeric','numeric'),na.strings = '?')
powerdata <- subset(powerdata,Date=='1/2/2007'|Date=='2/2/2007')

png('plot1.png',width=480,height=480)
with(powerdata, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))
dev.off()