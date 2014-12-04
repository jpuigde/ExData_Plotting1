setwd("C:/Development/03-R/04-Exploratory")

colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

household_power_consumption <- read.csv("household_power_consumption.txt",
                                        header = TRUE, 
                                        sep = ";",
                                        comment.char = "?",
                                        colClasses=colClasses,
                                        stringsAsFactors =FALSE)

HPCsubset <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007","2/2/2007"))

#Plot 4----
op <- par(mfrow = c(2, 2),cex=.64)
with(HPCsubset,
     {
        plot(Global_active_power,
             type = "l",
             yaxp=c(0,6,3),
             ylab="Global Active Power",
             xlab=NA,
             xaxt="n")
        axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
        ########################################################         
        plot(Voltage,
             type = "l",
             yaxp=c(234,246,6),
             ylab="Voltage",
             xlab="datatime",
             xaxt="n")
        axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
        ########################################################         
        plot(Sub_metering_1, 
                             type = "n",
                             ylab="Energy Sub metering",
                             xaxt="n",
                             xlab=NA,
                             yaxp=c(0,30,3)
        )
        axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
        lines(Sub_metering_1)
        lines(Sub_metering_2,col="red")
        lines(Sub_metering_3,col="blue")
        legend(1000,39.5,
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1),
               bty="n",
               col=c("black","blue","red")
               )
        ########################################################         
        plot(Global_reactive_power,
             type = "l",
             yaxp=c(0,0.5,5),
             ylab="Global_reactive_power",
             xlab="datatime",
             xaxt="n")
        axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
})
dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()
par(mfrow = c(1, 1))



