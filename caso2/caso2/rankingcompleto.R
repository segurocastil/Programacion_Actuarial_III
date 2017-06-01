setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso2/outcome/")
rankingcompleto <- function(resultado,num="mejor"){
    base <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    resultados<-c("falla", "ataque","neumonia")
    validar2 <- resultados==resultado
    suma2 <- sum(validar2)
    
    if (suma2 != 1) {
        stop("valor inválido")
    }
    
    if (resultado =="ataque"){
        y <- 11 
    } else if (resultado=="falla"){
        y <- 17
    }else if(resultado=="neumonia"){
        y <- 23
    }
    
    if(num == "mejor"){
        num <- 1
    }
    xx <- split(base,base[,7])
    a <-vector("numeric")
    
    if (is.numeric(num)== TRUE){
        for (i in 1:54){
            n <- xx[[i]]
            n[,y] <- suppressWarnings(as.numeric(n[,y]))
            orden <- order(n[,y],n[,2])
            hospitales <- n[orden,2]
            nn <- hospitales[num]
            a <- c(a,nn)
        }
        
    }else if (num == "peor"){
        num <- 1
        for (i in 1:54){
            n <- xx[[i]]
            n[,y] <- suppressWarnings(as.numeric(n[,y]))
            orden <- order(n[,y],n[,2],decreasing = T)
            hospitales <- n[orden,2]
            nn <- hospitales[num]
            a <- c(a,nn)
        }
    }
    valores <- data.frame(a,names(xx))
    names(valores) <- c("hospital","estado")
    rownames(valores) <- names(xx)
    valores
}
head(rankingcompleto("ataque",20),10)
tail(rankingcompleto("neumonia","peor"),3)
tail(rankingcompleto("falla"),10)