# Programacion_Actuarial_III
Primavera 2016

####Introducción Los datos analizados en este caso son recabados de los acelerómetros de celulares Samsung Galaxy, pero vienen en diferentes archivos de texto, la misión es acomodarlos de tal forma que sean entendibles para cualquiera.

####Parte 1 Tenemos que juntar los datos de train y test de x, luegos los mismos, pero de y, también juntamos los sujetos de prueba y leemos "feature.txt" para usarlos despues.

Juntarx = rbind(read.table("./Caso3/train/X_train.txt"), 
                read.table("./Caso3/test/X_test.txt"))
Juntary = rbind(read.table("./Caso3/train/y_train.txt"),
                read.table("./Caso3/test/y_test.txt"))[,1]
JuntarSub = rbind(read.table("./Caso3/train/subject_train.txt"),
                read.table("./Caso3/test/subject_test.txt"))
Titulo = read.table("./Caso3/features.txt")
####Parte 2 Tenemos que usar únicamente los datos de media y desviación estandar de los datos. Primero tenemos que ponerle los nombres a las columnas de los datos, de otra forma sería dificil hacerlo después.

        colnames(Juntarx) <- Titulo[,2]
Mediastd = grepl('-(mean|std)\\(', Titulo[,2])
Juntarx = Juntarx[Mediastd]
####Parte 3 Hay que poner los nombres de las actividades (Walking, walking upstairs, etc.) a "Juntary".

Act = as.character(read.table("./Caso3/activity_labels.txt")[,2])
Juntary = Act[Juntary]
####Parte 4 En este paso ya está hecho, pero se pueden escribir los nombres de las columnas de una forma más amena, luego juntamos los datos para formar la tabla de datos final.

cambio = colnames(Juntarx)
    cambio = gsub("\\()", "", cambio)
    cambio = gsub('([[:upper:]])', ' \\1', cambio)
    cambio = gsub("Body Body", "Body", cambio)
    cambio = gsub("\\-", " -", cambio)
    cambio = gsub("-mean", "- Media", cambio)
    cambio = gsub("-std", "- DesvEst", cambio)
    cambio = gsub("t", "T", cambio)
    cambio = gsub("f", "F", cambio)
colnames(Juntarx) = cambio

Sujeto = JuntarSub
colnames(Sujeto) = "Sujeto"
Acción = Juntary
Final = cbind(Sujeto, Acción, Juntarx)
####Parte 5 Hay que s
