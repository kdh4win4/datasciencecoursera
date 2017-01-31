pollutantmean <-
function(directory, pollutant, id = 1:332){
    dir <- paste("/Users/dkim/Downloads/", directory, sep = "")
    filenames <- list.files(path=dir,pattern=".*csv")
    i=1

    for (i in id){
        x <- read.csv(filenames[i])
        if(i== id[1]) {xs<-x}
        else {xs=rbind(xs, x)}
        i = i + 1
        }
    # if((id<1) | (id>332)){
    #     print("Could you input right ID number please")
    #     break
    # }
    #for(id in id[1]:id[end(id)][1]){
    if (pollutant == "sulfate"){
        ms <- mean(xs$sulfate[complete.cases(xs$sulfate)]) # key
        # return(paste("ID number_", id, pollutant, "mean is", ms, sep = " "))
        return(ms)
    }
    else if(pollutant == "nitrate"){
        ms <- mean(xs$nitrate[complete.cases(xs$nitrate)])
        # return(paste("ID number_", id, pollutant, "mean is", ms, sep = " "))
        return(ms)
    }
    else
        print("Could you input right name of pollutant please")
    # id = id+1
    # }
}
