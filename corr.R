corr <- function(directory,threshold=0)
{
   
   filenames <- list.files(directory, pattern="*.csv")
   
   cur <- numeric(0)
   
   count <- 0
   
   
   for (i in 1:332) 
    {
          good <- 0
                  
          filename <- paste (directory,filenames[i],sep="/")
         
          dataset <- read.csv(filename,header=TRUE,sep=",")
          good    <- complete.cases(dataset[,2],dataset[,3])
          result <- 0
          
          if (sum(good) > threshold )
            {
               count <- 1
             ds <- dataset[,2]
             dn <- dataset[,3]
            
             result <- cor(dn,ds,use="complete.obs", method = c("pearson"))
                                     
             cur <- c(cur,result)
                         
              
            
            }
           
     } 
        
       return(cur)
 }

   

