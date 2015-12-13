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

#Making plot2
Sys.setlocale("LC_TIME", "en_US")

png(filename = "plot2.png",width = 480, height = 480,bg="transparent")

plot(ihepcd$nt,ihepcd$Global_active_power,type="n",xlab=" ",ylab ="Global Active power (Kilowatts)")
lines(ihepcd$nt,ihepcd$Global_active_power,type="l")

dev.off()