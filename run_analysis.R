
#peer assignment -
setwd("~/Downloads/Coursera/")
#if(!file.exists("./data")){dir.create("./data")}   # already I have the dir
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/samsung.zip")
unzip(zipfile="./data/samsung.zip")

# test trainings files:
setwd("~/Downloads/Coursera/data/")
a <- read.table('UCI HAR Dataset/activity_labels.txt')
f <- read.table('UCI HAR Dataset/features.txt')

x <- read.table("UCI HAR Dataset/train/X_train.txt")
x1 <- read.table("UCI HAR Dataset/test/X_test.txt")
y <- read.table("UCI HAR Dataset/train/y_train.txt")
y1 <- read.table("UCI HAR Dataset/test/y_test.txt")
s <- read.table("UCI HAR Dataset/train/subject_train.txt")
s1 <- read.table("UCI HAR Dataset/test/subject_test.txt")


head(x)
head(y)
head(x1)
head(y1)
head(s1)
head(s)

unique(s1)
unique(s)
unique(x1)

colnames(x1) <- f$V2
colnames(x) <- f$V2
colnames(y1) <- "number"
colnames(s1) <- "participants"
colnames(y) <-"number"
colnames(s) <- "participants"

colnames(a) <- c('number','Activity')


m <- cbind(x, y, s)
m1 <- cbind(x1, y1, s1)
ALL <- rbind(m, m1)
dim(ALL)
#[1] 10299   563

colnames(ALL)
colNames <- colnames(ALL)

M <- grepl("mean", colnames(ALL))
S <- grepl("std", colnames(ALL))
N <- grepl("number", colnames(ALL))
P <- grepl("participants", colnames(ALL))
MS <- M|S|N|P


ALL_MS <- ALL[ , MS == T]
ALL_MS[1:2, 1:5]
dim(ALL_MS) #[1] 10299    79
colnames(ALL_MS)
mmm <- merge(ALL_MS, a, by='number', all.x=T )
mxx <- aggregate(. ~participants + number, mmm, mean)
mxx <- mxx[order(mxx$participants, mxx$number),]
setwd("~/Downloads/Coursera/data/")
write.table(mxx, "Samsung_galaxy_tidy_dataset.txt", row.name=F)
