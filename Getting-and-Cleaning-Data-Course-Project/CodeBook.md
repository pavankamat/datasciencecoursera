---
title: "Getting and Cleaning Data Course Project CodeBook"
author: "Pavan Kamat"
date: "10/13/2016"
output: html_document
---

## Source Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## Variables Used

#### Tables from downloaded data files

Subject Files

* subjectTrainData - /UCI HAR Dataset/train/subject_train.txt
* subjectTestData  - /UCI HAR Dataset/test/subject_test.txt

Activity Files

* activityTrainData - /UCI HAR Dataset/train/y_train.txt
* activityTestData  - /UCI HAR Dataset/test/y_test.txt

Data Files

* trainData - /UCI HAR Dataset/train/X_train.txt
* testData  - /UCI HAR Dataset/test/X_test.txt

Features Data

* featuresData - /UCI HAR Dataset/features.txt

Activity Labels

* activityLabels - /UCI HAR Dataset/activity_labels.txt

Merged data set by combining training and the test sets for Subject and Activity

* mergedSubjectData
* mergedActivityData

Transformed Tidy Data Set

* dataTable

## Transformations/Work performed to clean up the data

The run_analysis R program reads in the data from the source and transforms the data into a tidy data set.

* The test dataset and training dataset for Subject and Activity are read and merged into 2 data frames (mergedSubjectData and mergedActivityData)

* The colums of mergedSubjectData and mergedActivityData are given descriptive names instead of non-descriptive names like 'V1'

* The columns for Features Data are then given names based on the features.txt file.

* Change column names of activityLabels dataset from 'V1' to 'activityNumber' and from 'V2' to 'activityName'

* Columns that hold mean or standard deviation measurements are selected from the dataset.

* The activity identifiers are replaced with the activity labels based on the activity_labels.txt file.

* Appropriately label the data set with descriptive variable names.

    + "std()" is replaced with "STD"

    + "mean()" is replaced with "MEAN"

    + "Acc" is replaced with "Accelerometer"

    + "Gyro" is replaced with "Gyroscope"

    + "Mag" is replaced with "Magnitude"

    + "BodyBody"is replaced with "Body"

    + All "t" if in the first place are replaced with "time"

    + All "f" if in the first place are replaced with "frequency"

* The data is then grouped by subject and activity, and the mean is calculated for every measurement column.

* Finally, the tidy dataset is written to a file named 'TidyDataSet.txt'.



