complete <- function(directory,id = 1:332 )
{
   
   filenames <- list.files(directory, pattern="*.csv")
   
   result <- data.frame()
   if ( length(id) > 332) 
  {
    length(id) <- 332
  }
   
   for (i in 1:length(id)) 
    {
          good <- 0
          j <- id[i]
         
          filename <- paste (directory,filenames[j],sep="/")
         
          dataset <- read.csv(filename,header=TRUE,sep=",")
          good    <- complete.cases(dataset[,2],dataset[,3])
          sum <-  sum(good)
          if ( i == 1 )
          {
             result <- data.frame(id=id[i],nobs=sum)
            
          }else
          { 
             result <- rbind(result,c(id=id[i],nobs=sum))
            
          }
          rm(dataset)
            
     } 
        
        print (result)
 }

   

