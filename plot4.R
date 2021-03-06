powerdata <- read.table('household_power_consumption.txt',header=T,sep=';',
        colClasses = c('character','character','numeric','numeric','numeric',
        'numeric','numeric','numeric','numeric'),na.strings = '?')
powerdata <- subset(powerdata,Date=='1/2/2007'|Date=='2/2/2007')
powerdata$Time<-strptime(paste(powerdata$Date,powerdata$Time,sep = ' '), '%d/%m/%Y %H:%M:%S', tz = '')
powerdata$Date<-as.Date(powerdata$Date,'%d/%m/%Y')

png('plot4.png',width=480,height=480)
par(mfrow = c(2,2))

#Top Left
with(powerdata, plot(Time, Global_active_power, ylab = 'Global Active Power', type = 'l'))

#Top Right
with(powerdata, plot(Time, Voltage, xlab = 'datetime', type = 'l'))

#Bottom Left
plot(powerdata$Time, powerdata$Sub_metering_1, type = 'n', ylab = 'Energy sub metering')
points(powerdata$Time, powerdata$Sub_metering_1, type = 'l')
points(powerdata$Time, powerdata$Sub_metering_2, type = 'l', col = 'red')
points(powerdata$Time, powerdata$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lwd = c(1,1,1), col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Bottom Right
with(powerdata, plot(Time, Global_reactive_power, xlab = 'datetime', type = 'l'))

dev.off()
