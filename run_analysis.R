# Sec 0 - This block of code is to read file from URL, Unzip and copy on user's machine

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("data")){
        dir.create("data")
}

if(!file.exists("./data/Human_Activity_Recognition.zip")){
        download.file(fileURL,"./data/Human_Activity_Recognition.zip")
        unzip("./data/Human_Activity_Recognition.zip", exdir="./data")
}

# Sec 1 - This block of code loads required libraries in session
if (!require(data.table)){
        install.packages("data.table")
}

require("data.table")

# Sec 2 - This block of code loads data and creates object in R environment

testData  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
testData_Activity  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)
testData_Subject  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)

trainData  <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainData_Activity  <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainData_Subject  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Sec 3 - This block of code merges data into one set (Problem 1 in assignment)

testData <- cbind(testData,testData_Activity)
testData <- cbind(testData,testData_Subject)
trainData <- cbind(trainData,trainData_Activity)
trainData <- cbind(trainData,trainData_Subject)
oneDataSet <- rbind(testData,trainData)
head(oneDataSet,10)

# Sec 4 - Calculates and prints mean on common data set (Problem 2)

oneDataSet_Mean <- sapply(oneDataSet,mean,na.rm=TRUE)
oneDataSet_sd <- sapply(oneDataSet,sd,na.rm=TRUE)
oDataneDataSet_Mean
oneDataSet_sd


# Sec 5 - Assign Activity Labels (Problem 3)

activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
testData_Activity$V1 <- factor(testData_Activity$V1,levels=activityLabels$V1,labels=activityLabels$V2)
trainData_Activity$V1 <- factor(trainData_Activity$V1,levels=activityLabels$V1,labels=activityLabels$V2)

# Sec 6 - Appropriately naming entire dataset (Problem 4)

features <- read.table("./data/UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")

colnames(testData)<-features$V2
colnames(trainData)<-features$V2
colnames(testData_Activity)<-c("Activity")
colnames(trainData_Activity)<-c("Activity")
colnames(testData_Subject)<-c("Subject")
colnames(trainData_Subject)<-c("Subject")

# Sec 7 - Create secondary dataset (Problem 5) 
# This would require creating oneDataSet again to get the labels assigned

testData <- cbind(testData,testData_Activity)
testData <- cbind(testData,testData_Subject)
trainData <- cbind(trainData,trainData_Activity)
trainData <- cbind(trainData,trainData_Subject)
oneDataSet <- rbind(testData,trainData)

DF <- data.table(oneDataSet)
secDataSet<-DF[,lapply(.SD,mean),by="Activity,Subject"]
write.table(secDataSet,file="./CourseEra/statisticalanalysis/tidy.csv",sep=",",row.names = FALSE)







