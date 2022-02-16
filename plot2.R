url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")
unzip("./dataset.zip", exdir = getwd())


data = read.table('./household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

df = subset(data,  subset = (data$Date =="2007-02-01" | data$Date =="2007-02-02"))



df$DateTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$DateTime <- as.POSIXct(df$DateTime)

plot(df$DateTime, df$Global_active_power, type="l", xlab="Date", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()