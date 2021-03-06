setwd("C:/Users/Marco Antonio/Documents/GitHub/Programacion_Actuarial_III/caso1/specdataa/specdata")


mediacontaminante <- function(directorio,contaminante,id=1:332){   
    
    id2 <- vector("character")
    x2 <- vector("numeric")
    
    for (i in id){ 
        
        if (i>=1 && i<10){ 
            id2[i] <- paste("00",i,".csv", sep="") } 
        else { 
            if (i>=10 && i<100){ 
                id2[i] <- paste("0",i,".csv", sep="") } 
            else { 
                id2[i] <- paste(i,".csv", sep="") 
                } 
            }
        
        y <- read.csv(id2[i]) ##lee y crea un data frame
        z <- cbind(y[,contaminante])
        
        x2 <- rbind(x2,z)
        
        medias <- mean(x2,na.rm=TRUE)
    }
    medias
    
}


mediacontaminante("specdata","sulfate",50:70)