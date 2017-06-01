setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso2/outcome/o")
mejor <- function(estado,resultado){
    base <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    base <- data.frame(base[2],base[7],base[11],base[17],base[23])
    
    if (resultado == "ataque"){
        base1 <- data.frame(base[1],base[2],base[3])
        base1 <- base1[base1[3]!= "Not Available",]
    }
    else if (resultado == "falla") {
        base1 <- data.frame(base[1],base[2],base[4])
        base1 <- base1[base1[3]!= "Not Available",]
    }
    else if (resultado == "neumonia") {
        base1 <- data.frame(base[1],base[2],base[5])
        base1 <- base1[base1[3]!= "Not Available",]
    }
    else{
        stop("valor incorrecto")
    }
    XX <- base[,2]
    if (!estado %in% XX){
        stop("estado incorrecto")
    }
    base1 <- base1[base1[2]== estado,]
    minimo <- which.min(base1[,3])
    base2 <- base1[,3]
    minimo2 <- base2[minimo]
    base1 <- base1[base1[3]==minimo2]
    base3 <- base1[1]
    base3
}

mejor("TX", "ataque") 
mejor("TX", "falla")
mejor("MD", "ataque")
mejor("MD", "neumonia")
mejor("BB", "ataque") 
mejor("NY", "atakue") 

