#setting my working directory

setwd("~/Documents/Exploratory Data Analysis/ExData_Plotting1")

#loadind the library sqldf

library(sqldf)

#reading the household consumption file on my computer.
#you should change the directory in this command
file <-file.path("/Users/mac/Documents/Exploratory Data Analysis","household_power_consumption.txt") 

#converting the file in a data.frame
#It takes some time: be patient
ihepcd <- read.csv2.sql(file, sql = "select * from file where Date in ('1/2/2007','2/2/2007')",na.strings="?")
ihepcd$nt <- paste(ihepcd$Date,ihepcd$Time,sep=" ")
ihepcd$nt<- strptime(ihepcd$nt,format="%d/%m/%Y %H:%M:%S")
format(ihepcd$nt,"%c")

#Making plot4
Sys.setlocale("LC_TIME", "en_US")

png(filename = "plot4.png",width = 480, height = 480,bg="transparent")

par(mfcol=c(2,2))

plot(ihepcd$nt,ihepcd$Global_active_power,type="n",xlab=" ",ylab ="Global Active power")
lines(ihepcd$nt,ihepcd$Global_active_power,type="l")

plot(ihepcd$nt,ihepcd$Sub_metering_1,type="n",xlab=" ",ylab ="Energy sub metering")
lines(ihepcd$nt,ihepcd$Sub_metering_1)
lines(ihepcd$nt,ihepcd$Sub_metering_2,col="red")
lines(ihepcd$nt,ihepcd$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty="n",cex=0.8)

plot(ihepcd$nt,ihepcd$Voltage,type="n",xlab="datetime",ylab ="Voltage")
lines(ihepcd$nt,ihepcd$Voltage)

plot(ihepcd$nt,ihepcd$Global_reactive_power,type="n",yaxt="n",xlab="datetime",ylab ="Global_reactive_power")
lines(ihepcd$nt,ihepcd$Global_reactive_power)
axis(2, at = seq(0.0,0.5,by=0.1), labels = seq(0.0,0.5,by=0.1), tick = TRUE,cex.axis=0.8)

dev.off()