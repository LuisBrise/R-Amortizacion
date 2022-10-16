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
  periodo.primermes = as.numeric(fechas.df$fechafinalmes[1] 
                                 - fechas.df$fechainicialmes[1])
  
  if(mensual){
    tasaDEinteres <- interes/12
  }
}

Calendarios[Calendarios$idcredito==1,]
