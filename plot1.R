## Exploratory Data Analysis
## Course Project 1
## PLOT 1

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


#create the PNG file for PLOT 1
png( file="./Course Project 1/ExData_Plotting1/plot1.png")

#Set par
par(mfrow=c(1,1))

#Historam
hist(hhlpc.subset$Global_active_power, col = "red", 
     main = "Glogal Active Power",
     xlab="Global Active Power (kilowatts)"
     ) 
dev.off() 



