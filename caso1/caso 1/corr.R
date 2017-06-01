setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso1/specdataa/specdata")


corr <- function (directorio, horizonte = 0) {
    x <- vector("numeric")
    y <- vector("numeric")
    
    for(i in 1:332){
        #lectura de Datos
        if (i<10) {
            tabla <- read.csv(paste("00", i, ".csv", sep=""))
        }else if(i>=10 && i<100 ) {
            tabla<-read.csv(paste("0", i,".csv", sep=""))
        }else {
            tabla<-read.csv(paste(i,".csv",sep=""))
        }
        
        completos <- complete.cases(tabla)
        z <- tabla[completos, ]
        nf <- nrow(z)
        #restriccion de horizonte
        
        if (nf>horizonte) {
            y <-  cor(z[2],z[3])
            y2<-as.vector(y)
            x <- c(x,y2)
        }
        
    }
    
    x
}
corr("specdata",45)
