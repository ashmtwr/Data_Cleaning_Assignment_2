
## Introduction
### CodeBook for CourseEra Data Cleaning Assignment-2 

#### Data Set

Data set can be accesses from the link below -

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#### Download Data set on your local machine

````{r}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("data")){
        dir.create("data")
}

if(!file.exists("./data/Human_Activity_Recognition.zip")){
        download.file(fileURL,"./data/Human_Activity_Recognition.zip")
        unzip("./data/Human_Activity_Recognition.zip", exdir="./data")
}
```

#### Key Objects Created in run_analysis.R

```{r}
testData  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
testData_Activity  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)
testData_Subject  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)

trainData  <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainData_Activity  <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainData_Subject  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)

oneDataSet <- rbind(testData,trainData)

features <- read.table("./data/UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")

secDataSet<-DF[,lapply(.SD,mean),by="Activity,Subject"]
```




