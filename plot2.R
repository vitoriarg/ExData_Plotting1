
library(dplyr)
library(lubridate)

file <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db <- file %>% 
  mutate(Date = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Time = NULL) %>%
  subset(Date >= dmy("01/02/2007") & Date < dmy("03/02/2007"))

png("plot2.png", height = 480, width = 480)
plot(x = db$Date, y = db$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts")
