complete <-
function(directory, id = 1:332){
    dir <- paste("/Users/dkim/Downloads/", directory, sep = "")
    filenames <- list.files(dir, pattern = ".*csv") 
    tt <- matrix(NA, nrow = length(id), ncol = 2)
    tt[,1] <- id
    colnames(tt) <- c("id", "nobs")
    i=1
    for(i in 1:length(id))
    {
     s1 <- read.csv(filenames[id[i]])
     tt[i,2] <- nrow(s1[complete.cases(s1),])
     i = i+1
    }
    return(tt)
}
