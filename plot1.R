url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")
unzip("./dataset.zip", exdir = getwd())

data = read.csv2('./household_power_consumption.txt', header = TRUE)

df = subset(data,  as.Date(data$Date, format = "%d/%m/%Y") =="2007-02-01" | as.Date(data$Date, format = "%d/%m/%Y")=="2007-02-02")
df$Global_active_power <- as.numeric(df$Global_active_power)

with(df, hist(Global_active_power, col="red", main= "Global Active Power", xlab= "Global Active Power"))

dev.copy(png, file="plot1.png")
dev.off()
