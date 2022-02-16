url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")
unzip("./dataset.zip", exdir = getwd())

data = read.table('./household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

df = subset(data,  subset = (data$Date =="2007-02-01" | data$Date =="2007-02-02"))



df$DateTime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$DateTime <- as.POSIXct(df$DateTime)

par(mfrow=c(2,2))

plot(df$DateTime, df$Global_active_power, type="l", xlab="Date", ylab="Global Active Power (kilowatts)")

plot(df$DateTime, df$Voltage, xlab="datetime", ylab="Voltage", type = "l")

matplot(x=df$DateTime ,y=df[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")], type ="l" ,pch=1,
        xlab="Date", ylab="Energy Sub metering", col =c("black","red","blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("black","red","blue"),lty=1,pch=c(NA,NA,NA))

plot(df$DateTime, df$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_active_power")


dev.copy(png, file="plot4.png")
dev.off()











