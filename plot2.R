powerdata <- read.table('household_power_consumption.txt',header=T,sep=';',
        colClasses = c('character','character','numeric','numeric','numeric',
        'numeric','numeric','numeric','numeric'),na.strings = '?')
powerdata <- subset(powerdata,Date=='1/2/2007'|Date=='2/2/2007')
powerdata$Time<-strptime(paste(powerdata$Date,powerdata$Time,sep = ' '), '%d/%m/%Y %H:%M:%S', tz = '')
powerdata$Date<-as.Date(powerdata$Date,'%d/%m/%Y')

png('plot2.png',width=480,height=480)
with(powerdata, plot(Time, Global_active_power, ylab = 'Global Active Power (kilowatts)', type = 'l'))
dev.off()
