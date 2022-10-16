# Prueba Unilogic R

# Parte 1

#Bibliotecas
library(readxl) # Leer archivos de Excel
library(plyr) # Tools for Splitting, Applying and Combining Data
library(dplyr)
library(ggplot2)
library(tidyverse)

# Leer los archivos Creditos y Calendarios
Calendarios.df <- read_excel("Calendarios.xlsx")
Creditos.df <- read_excel("Creditos.xlsx")

# Puedes usar "attributes" para conocer las entradas de los data.frames

periodos <- levels(as.factor(Creditos$periodicidadamortizacion))
esquemas.amort <- levels(as.factor(Creditos$esquemadeamortizacion))

options(digits = 7) # precisión 7
options(scipen = 999) #sin notación científica

saldoInsoluto <<- numeric() 
interes <- numeric()
amortizacion <<- numeric()
amortizacionAcumulada <<- numeric()

amortizacionNormal1 <- function(df){
  
  id = df$idcredito
  periodicidad = df$periodicidadamortizacion
  esquema = df$esquemadeamortizacion
  iva = df$tasaiva
  tasa.interes = df$tasacontractual
  capital = df$saldoinicialcredito
  
  fechas.df = Calendarios.df[Calendarios$idcredito==id,] # Selecciona solo las fechas con el mismo idcredito
  periodos = length(fechas.df$fechainicialmes) #Cuanto el número de fechas
  dias.por.periodo = as.numeric(fechas.df$fechafinalmes 
                                 - fechas.df$fechainicialmes)
  
  if (periodicidad == "mensual"){
    
    dias.por.periodo[dias.por.periodo>=27] <- 30 #Todas los periodos con 27 o más días "pesan" 30 días (homogeneizar)
    
    if (esquema == "pagos fijos (iva incluido) mensual"){
      tasa.periodo = tasa.interes/12. # 12 meses por año
    }
    else {
      tasa.periodo = tasa.interes*(1 + iva)/12.
    }
  }
  else{
    
    dias.por.periodo[dias.por.periodo>=54] <- 60 #Todas los periodos con 27 o más días "pesan" 30 días (homogeneizar)
    
    tasa.periodo = tasa.interes/6. # 6 bimestres por año 
  }
  
}

Calendarios[Calendarios$idcredito==1,]

error <- 0
nerror <- numeric()
for (np in 1:length((Calendarios$idcredito))){
  fechasp<-as.numeric(Calendarios[Calendarios$idcredito==np,]$fechafinalmes 
                      - Calendarios[Calendarios$idcredito==np,]$fechainicialmes)
  diasi <- format(Calendarios[Calendarios$idcredito==id,]$fechainicialmes, format = "%d")
  diasf <- format(Calendarios[Calendarios$idcredito==id,]$fechafinalmes, format = "%d")
  
  if (mean(fechasp) > 31){
    ndias = 60
    fechasp[2:length(fechasp)-1] <- ndias
  }
  else {
    ndias = 30
    fechasp[2:length(fechasp)-1] <- ndias
  }
  
  if (dias[1] != dias[2]){
    fechasp[1]
  }
}
print("Hubo ", error, " errores")


np <- 1
fechasp<-as.numeric(Calendarios[Calendarios$idcredito==np,]$fechafinalmes 
                    - Calendarios[Calendarios$idcredito==np,]$fechainicialmes)
fechasp
diasi <- format(Calendarios[Calendarios$idcredito==np,]$fechainicialmes, format = "%d")
diasf <- format(Calendarios[Calendarios$idcredito==np,]$fechafinalmes, format = "%d")
diasi
diasf
