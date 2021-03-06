## Exploratory Data Analysis
## Course Project 1
## Plot 3

#Set up working directory
setwd("D:/Coursera/Data Scientist Specialisation/Exploratory Data Analysis")

# Reading data
hhlpc<-read.table("./Course Project 1/household_power_consumption.txt", stringsAsFactors= F,
                  na.strings = c("","?"), sep = ";", header = T
)
#check data
head(hhlpc)
str(hhlpc)

# Subset only data that will be further used
hhlpc.subset<-subset(hhlpc,Date %in% c("1/2/2007","2/2/2007"),)
#check results
table(hhlpc.subset$Date) #1440 rows of each date -> 2880 total

#convert to date and time variables
hhlpc.subset$Date2<-strptime(paste(hhlpc.subset$Date,hhlpc.subset$Time,
                                   " "),format="%d/%m/%Y %T")

#check result
class(hhlpc.subset$Date2)

## Creating the Plot


#create the PNG file for PLOT 3
png( file="./Course Project 1/ExData_Plotting1/plot3.png") #default is 480x480

#set par
par(mfrow=c(1,1))

#Line chart
#!!!!!!!!!!
#Note since I am in Buglaria date is returned in cyrellic 
#(this is time and region settings on my PC)
#!!!!!!!!!!
#Where "����" = "Thursday", "���" = "Friday", "���" =  "Saturday"

#main plot with sub matering 1 , y label
with(hhlpc.subset,plot(Date2,Sub_metering_1, col = "black",
     ylab="Energy sub metering",xlab="",type = "l"
))
#add submetering 2
with(hhlpc.subset,lines(Date2,Sub_metering_2,col="red"))
#add submetering 3
with(hhlpc.subset,lines(Date2,Sub_metering_3,col="blue"))

#add legend
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)

dev.off() 

