## Building Tidy data set from raw data set

## Part One: Data import and manipulation ******************************
#************************************************* 

setwd("~/Bureau/COURSERA/data/UCI HAR Dataset/")
**
 ## 1- Training data
   feature <- read.table("features.txt", header=FALSE)

   # Transform the 2nd column to charater in order to use it as variables names
   feature[,2] <- as.character(feature[,2])

   # Other data sets
   id <- read.table("train/subject_train.txt", header=FALSE)
   activity <- read.table("train/y_train.txt", header=FALSE)
   X_train <- read.table("train/X_train.txt", header=FALSE)

   ## Merging train data
   train <- cbind(id, activity, X_train)
   colnames(train) <- c("Subject", "Activity", feature[,2])


 ## 2- Test data
    id <- read.table("test/subject_test.txt", header=FALSE)
    activity <- read.table("test/y_test.txt", header=FALSE)
    X_test <- read.table("test/X_test.txt", header=FALSE)
  

   ## Merging test data
    test <- cbind(id, activity, X_test)
    colnames(test) <- c("Subject", "Activity", feature[,2])


  ## 3. Merge the two data sets (training and test data)
## The merging is done here by "rbinding" the two data sets
data <- rbind(train, test)


## Part Two: First data set for this assignment: Only variables relative to "mean"
# and "std" *********************************

dataOnlyMeanSD <- data[,c(1,2, grep("mean", colnames(data)), grep("std", colnames(data)))]

## Activity labels
activityName=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")


for (i in 1:6){
  dataOnlyMeanSD[dataOnlyMeanSD[,2]==i,2] <- activityName[i]
}

for (i in 1:6){
  data[data[,2]==i,2] <- activityName[i]
}

write.table(dataOnlyMeanSD, "DataOnlyMeanSD.txt", row.names = FALSE)



## Part three: Second data set with average of each variable by Activity
# and Subject *****************************************

dataAverageSubjectActivity <- data.frame(Activity_Subject= unique(interaction(data$Activity, data$Subject)))

for (i in 3:563) dataAverageSubjectActivity[,(i-1)] <- as.numeric(sapply(split(data[,i], list(data[,1], data[,2])), mean))

## Labelling variable for the second data set
colnames(dataAverageSubjectActivity)[-1] <- colnames(data)[-c(1:2)]

write.table(dataAverageSubjectActivity, "dataAverageSubjectActivity.txt", row.names = FALSE)
