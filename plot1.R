rm(list=ls())
setwd("C:/Development/03-R/04-Exploratory")

colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

household_power_consumption <- read.csv("household_power_consumption.txt",
                                        header = TRUE, 
                                        sep = ";",
                                        comment.char = "?",
                                        colClasses=colClasses,
                                        stringsAsFactors =FALSE)

HPCsubset <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007","2/2/2007"))

#Plot 1----
png("plot1.png",width = 480, height = 480)
hist(HPCsubset$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red",
     xaxp=c(0,6,3),
     yaxp=c(0,1200,6))
dev.off()