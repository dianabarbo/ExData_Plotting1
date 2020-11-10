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

## PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(consumption, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global_rective_power",xlab="")
})

## Guardando y cerrando archivo
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()