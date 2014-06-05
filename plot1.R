setwd("~/Coursera/Class 4 - Explore Data")

## Read Data
energy<-read.table("household_power_consumption.txt",sep=";",na.strings="?",colClasses="character",header=T)

## Format data
energy$Global_active_power<-as.numeric(energy$Global_active_power)
energy$Date.new<-as.Date(energy$Date,format="%d/%m/%Y")

## Subset Data
energy.sub<-subset(energy, Date.new >= as.Date("2007-02-01") & Date.new <= as.Date("2007-02-02"))

png(filename = "plot1.png",width = 480, height = 480, units = "px")
## Create the plot
hist(energy.sub$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main=("Global Active Power"))



dev.off()
