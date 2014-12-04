setwd("C:/Development/03-R/04-Exploratory")

colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

household_power_consumption <- read.csv("household_power_consumption.txt",
                                        header = TRUE, 
                                        sep = ";",
                                        comment.char = "?",
                                        colClasses=colClasses,
                                        stringsAsFactors =FALSE)

HPCsubset <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007","2/2/2007"))


#Plot 2----
png("plot2.png",width = 480, height = 480)
plot(HPCsubset$Global_active_power,
     type = "l",
     yaxp=c(0,6,3),
     ylab="Global Active Power (kilowatts)",
     xlab=NA,
     xaxt="n")
axis(1, at=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
dev.off()