Tabela<-matrix(nrow=61, ncol=4)

guarda=(DataSet$date[1]); 
numero=0; 
soma=0;
index<-1;
for (i in 1:17568) {
        if (guarda != DataSet$date[i]) { Tabela[index, 1] <-guarda;
                                         Tabela[index, 2] <-as.numeric(soma);
                                         Tabela[index, 3] <-numero;                                                guarda <- DataSet$date[i];
                                         Tabela[index, 4] <-as.numeric(soma)/numero;
                                         numero=0; 
                                         soma=0;
                                         index<-index + 1;
        }
        if (!is.na(DataSet$steps[i])) {soma <- soma + DataSet$steps[i]}  
        numero<- numero + 1; 
}

qplot(as.Date(Tabela[,1]), as.numeric(Tabela[,2]))
      
Mediana<-matrix(nrow=61, ncol=288)
guarda=(DataSet$date[1]); 
index<-1;
      
for (i in 1:17568) {
    if (guarda == DataSet$date[i]) {
       for (y in 1:288) { 
           if (!is.na(DataSet$steps[y])) {Mediana[index, (y+1)] <- DataSet$steps[y]}
       }
    }                          
    Mediana[index, 1] <- guarda;
    guarda <- DataSet$date[i+1];
    index<-index + 1;
}    
