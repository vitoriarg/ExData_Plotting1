
library(dplyr)
library(lubridate)

file <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db <- file %>% 
      mutate(Date = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Time = NULL) %>%
      subset(Date >= dmy("01/02/2007") & Date < dmy("03/02/2007"))

png("plot3.png", height = 480, width = 480)
plot(x = db$Date, y = db$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(db$Date, db$Sub_metering_2, type = "l", col = "red")
lines(db$Date, db$Sub_metering_3, type = "l", col = "blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), x = "topright")
dev.off()