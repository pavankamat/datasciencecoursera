# Read the already downloaded and unzipped files from the following URL
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# create tables from downloaded data files

# subject files
subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTestData  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# activity files
activityTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
activityTestData  <- read.table("./UCI HAR Dataset/test/y_test.txt")

# data files.
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
testData  <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Features Data
featuresData <- read.table('./UCI HAR Dataset/features.txt')

# Activity Labels
activityLabels<- read.table('./UCI HAR Dataset/activity_labels.txt')

# Merge the training and the test sets for Subject and Activity to create one data set.

mergedSubjectData <- rbind(subjectTrainData, subjectTestData)

# Rename the column from "V1" to "subject"
colnames(mergedSubjectData) <- "subject"

mergedActivityData<- rbind(activityTrainData, activityTestData)

# Rename the column from "V1" to "activityNumber"
colnames(mergedActivityData) <- "activityNumber"

# combine the training and the test sets
dataTable <- rbind(trainData, testData)

# name variables according to feature
colnames(featuresData) <- c("featureNumber", "featureName")

colnames(dataTable) <- featuresData$featureName

# change column names of activityLabels dataset from 'V1' to 'activityNumber' and from 'V2' to 'activityName'
colnames(activityLabels) <- c("activityNumber", "activityName")

# Merge columns
mergedSubjectData<- cbind(mergedSubjectData, mergedActivityData)
dataTable <- cbind(mergedSubjectData, dataTable)

# Extract only the mean and standard deviation from "features.txt"
# and add "subject" and "activityNumber"

dataTable<- subset(dataTable,select=c("subject","activityNumber", grep("mean\\(\\)|std\\(\\)",featuresData$featureName,value=TRUE)))

# enter name of activity into dataTable
dataTable <- merge(activityLabels, dataTable , by="activityNumber", all.x=TRUE)

# create dataTable with variable means sorted by subject and Activity
dataAggregate<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable <- dataAggregate[order(dataAggregate$subject, dataAggregate$activityName),]

# Appropriately label the data set with descriptive variable names.
names(dataTable)<-gsub("std()", "STD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))

names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))

# From the data set above, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

write.table(dataTable, "TidyDataSet.txt", row.name=FALSE)