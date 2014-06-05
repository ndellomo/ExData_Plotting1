
setwd("~/Coursera/Class 4 - Explore Data")

## Read Data
energy<-read.table("household_power_consumption.txt",sep=";",na.strings="?",colClasses="character",header=T)

## Subset Data
energy$Date.new<-as.Date(energy$Date,format="%d/%m/%Y")
energy.sub<-subset(energy, Date.new >= as.Date("2007-02-01") & Date.new <= as.Date("2007-02-02"))
rm(energy);gc()


## Format data
energy.sub$Global_active_power<-as.numeric(energy.sub$Global_active_power)

energy.sub$datetime<-paste(energy.sub$Date.new,energy.sub$Time, sep=" ")
energy.sub$datetime.new<-as.POSIXct(energy.sub$datetime)


png(filename = "plot3.png",width = 480, height = 480, units = "px")

with(energy.sub,
     plot(datetime.new,Sub_metering_1,type="l",xlab="",ylab="Energy sub meeting"))

with(energy.sub,
     lines(datetime.new,Sub_metering_2,col="red"))

with(energy.sub,
     lines(datetime.new,Sub_metering_3,col="blue"))

legend("topright",lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_Meeting_1", "Sub_Meeting_2" ,"Sub_Meeting_3"))

dev.off()
