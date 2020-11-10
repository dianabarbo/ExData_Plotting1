## Leyendo archivo
consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)

## Formato de la fecha DD/MM/AAAA
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")

## Filtrando las fechas dentro del rango 2007-02-01 y 2007-02-02
## Filtrando las fechas dentro del rango 2007-02-01 y 2007-02-02
initial <- "2007-2-1"
final <- "2007-2-2"
consumption <- subset(consumption,Date >= as.Date(initial) & Date <= as.Date(final))

## Combinando las columnas de fecha y hora
dateTime <- paste(consumption$Date, consumption$Time)

## Formato de la columna Fecha completa
consumption$dateTime <- as.POSIXct(dateTime)

## PLOT 3
plot(consumption$dateTime, consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption$dateTime, consumption$Sub_metering_2, col="red")
lines(consumption$dateTime, consumption$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))

## Guardando y cerrando archivo
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()