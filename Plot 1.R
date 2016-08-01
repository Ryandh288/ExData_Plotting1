###Plot 1

setwd("C:/Users/Ryan Honomichl/Dropbox/Coursera/4. Exploratory Data Analysis/Week 1")

if(!file.exists("./project")) dir.create("./project")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./project/Dataset.zip")

unzip(zipfile="./project/Dataset.zip",exdir="./project")
      

n.type <-c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",
        Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("./project/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",colClasses=n.type)

feb.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

feb.data$Date <- as.Date(feb.data$Date, "%d/%m/%Y")

feb.data <-na.omit(feb.data)

png(file="C:/Users/Ryan Honomichl/Dropbox/Coursera/4. Exploratory Data Analysis/Week 1/project/plot1.png",width=480, height=480)

hist(feb.data$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)

dev.off()









feb.data$Date <- strptime(feb.data$Date, format="%d/%m/%Y")



