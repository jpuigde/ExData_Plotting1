setwd("C:/Development/03-R/04-Exploratory")

colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

household_power_consumption <- read.csv("household_power_consumption.txt",
                                        header = TRUE, 
                                        sep = ";",
                                        comment.char = "?",
                                        colClasses=colClasses,
                                        stringsAsFactors =FALSE)

HPCsubset <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007","2/2/2007"))


#Plot 3----
png("plot3.png",width = 480, height = 480)
with(HPCsubset, plot(Sub_metering_1, 
                     type = "n",
                     ylab="Energy Sub metering",
                     xaxt="n",
                     xlab=NA,
                     yaxp=c(0,30,3)
                     ))
axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
lines(HPCsubset$Sub_metering_1)
lines(HPCsubset$Sub_metering_2,col="red")
lines(HPCsubset$Sub_metering_3,col="blue")
legend( "topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       col=c("black","red","blue")
       )
dev.off()
