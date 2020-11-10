## Leyendo archivo
consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)

## Formato de la fecha DD/MM/AAAA
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")

## Filtrando las fechas dentro del rango 2007-02-01 y 2007-02-02
consumption <- subset(consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Combinando las columnas de fecha y hora
dateTime <- paste(consumption$Date, consumption$Time)

## Formato de la columna Fecha completa
consumption$dateTime <- as.POSIXct(dateTime)

## PLOT 3
with(consumption, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Guardando y cerrando archivo
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()