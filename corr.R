corr <-
function(directory, threshold=0){
    dir <- paste("/Users/dkim/Downloads/", directory, sep = "")
    #tt <- matrix(NA, nrow = 332, ncol = 2)
    #tt[,1] <- 1:332
    filenames <- list.files(path=dir,pattern=".*csv")
    i=1
    
    com <- complete("specdata")
    com1 <- com[(com[,2] > threshold), ]
    corrlist <- numeric(length = nrow(com1)) 
    for (i in 1:nrow(com1)){
        corrlist[i] <- cor(read.csv(filenames[com1[i,1]])$sulfate,
                           read.csv(filenames[com1[i,1]])$nitrate,
                           use = "pairwise.complete.obs")
        }
    return(corrlist)
}
