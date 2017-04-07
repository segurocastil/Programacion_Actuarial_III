setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso1/specdataa/specdata")

completos <- function(directorio, id=1:332){
    x <- vector("numeric")
    
    for(i in id) {
        #Lectura de Datos
        if (i<10) {
            tabla <- read.csv(paste("00", i, ".csv", sep=""))
        }else if(i>=10 && i<100 ) {
            tabla<-read.csv(paste("0", i,".csv", sep=""))
        }else {
            tabla<-read.csv(paste(i,".csv",sep=""))
        }
        
        #Casos completos
        y <- complete.cases(tabla)
        z <- tabla[y, ]
        nf <- nrow(z)
        x <- c(x,nf)
    }
    
    table1 <- data.frame(id,nobs=x)
    table1
}
completos(,1:110)