## Leyendo archivo
consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)

## Formato de la fecha DD/MM/AAAA
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")

## Filtrando las fechas dentro del rango 2007-02-01 y 2007-02-02
initial <- "2007-2-1"
final <- "2007-2-2"
consumption <- subset(consumption,Date >= as.Date(initial) & Date <= as.Date(final))

## Combinando las columnas de fecha y hora
dateTime <- paste(consumption$Date, consumption$Time)

## Formato de la columna Fecha completa
consumption$dateTime <- as.POSIXct(dateTime)

## PLOT 2
plot(consumption$Global_active_power~consumption$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Guardando y cerrando archivo
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()