setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso2/outcome/o")
n<-1
rankhospital <- function(estado,resultado,num){
    
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
    base5 <- vector("numeric")
    
    if (num=="mejor"){
        num <- 1
        for (i in 1:(num)){
            minimo <- which.min(base1[,3])
            base2 <- base1[,3]
            minimo2 <- base2[minimo]
            base4 <- base1[base1[3]== minimo2,]
            base6 <- base4[,1]
            base6 <- sort(base6)
            base5 <- c(base5,base6)
            quitar <- nrow(base4)
            base1 <- base1[base1[3] != minimo2,]
            if (quitar>1){
                i <- i+(quitar-1)
                n<-n+quitar
            }
            
        }
        print(base5[num])
        num <- 0
    }
    if (num =="peor"){
        minimo <- which.max(base1[,3])
        base2 <- base1[,3]
        minimo2 <- base2[minimo]
        base4 <- base1[base1[3]== minimo2,]
        print(base4[,1])
        num <- 0
    }
    
    
    if (num < nrow(base1)){
        if (0 < num){
            for (i in 1:(num)){
                minimo <- which.min(base1[,3])
                base2 <- base1[,3]
                minimo2 <- base2[minimo]
                base4 <- base1[base1[3]== minimo2,]
                base6 <- base4[,1]
                base6 <- sort(base6)
                base5 <- c(base5,base6)
                quitar <- nrow(base4)
                base1 <- base1[base1[3] != minimo2,]
                if (quitar>1){
                    i <- i+(quitar-1)
                    n<-n+quitar
                }
                
            }
            print(base5[num])
        }
    }
    if (num > nrow(base1)){
        print("NA")
        
    }
}

rankhospital("TX", "falla", 4) 
rankhospital("MD", "ataque", "peor") 
rankhospital("MN", "ataque", 5000)













