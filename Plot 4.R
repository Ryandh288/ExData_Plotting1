###Plot 3

setwd("C:/Users/Ryan Honomichl/Dropbox/Coursera/4. Exploratory Data Analysis/Week 1")

if(!file.exists("./project")) dir.create("./project")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./project/Dataset.zip")

unzip(zipfile="./project/Dataset.zip",exdir="./project")


n.type <-c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",
           Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("./project/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",colClasses=n.type)

feb.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

feb.data <-na.omit(feb.data)

datetime <- strptime(paste(feb.data$Date, feb.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

datetime <- as.POSIXct(datetime)

final.data <- cbind(datetime, feb.data)

final.data$datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(final.data, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)

dev.off()




