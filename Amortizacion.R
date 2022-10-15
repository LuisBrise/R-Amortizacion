# Prueba Unilogic R

# Parte 1

#Bibliotecas
library(readxl) # Leer archivos de Excel
library(plyr) # Tools for Splitting, Applying and Combining Data
library(dplyr)
library(ggplot2)
library(tidyverse)

# Leer los archivos Creditos y Calendarios
Calendarios <- read_excel("Calendarios.xlsx")
Creditos <- read_excel("Creditos.xlsx")

# Puedes usar "attributes" para conocer las entradas de los data.frames

levels(Creditos$periodicidadamortizacion)
periodos <- levels(as.factor(Creditos$periodicidadamortizacion))
esquemas.amort <- levels(as.factor(Creditos$esquemadeamortizacion))

options(digits = 7) # precisión 7
options(scipen = 999) #sin notación científica

saldoInsoluto <<- numeric() 
interes <- numeric()
amortizacion <<- numeric()
amortizacionAcumulada <<- numeric()

amorizacionNormal <- funcion(idcredito,
                             capital, 
                             interes, 
                             periodos, 
                             fechainicial, 
                             fechafinal,
                             mensual=TRUE){
  if(mensual){
    tasaDEinteres <- interes/12
  }
}

Calendarios[Calendarios$idcredito==1,]
