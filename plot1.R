# please note that the dates in the plots are in portuguese because of the configurations of my program
library(dplyr)
library(lubridate)

#reads, edits and subsets data set
file <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db <- file %>% 
      mutate(Date = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Time = NULL) %>%
      subset(Date >= dmy("01/02/2007") & Date < dmy("03/02/2007"))

#creates plot
png("plot1.png", height = 480, width = 480)
hist(db$Global_active_power, main = "Global Active Power", col = "orangered1", xlab = "Global Active Power (kilowatts)", freq = TRUE)
dev.off()
