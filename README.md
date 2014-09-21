Getting and Cleaning Data Project
=================================

The R script provided in this repo, run_analysis.R, transform data collected from the accelerometers from the Samsung Galaxy S smartphone into a tidy data set, containing for each variable

Steps to use the script
-----------------------

* Set your working directory to the root of the project

 `setwd("/path-to-the-project")`

* Download and unzip raw data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the root of the project

* execute the script

  `source("run_analysis.R")`


Output
------

The script will execute the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The follwing files will be created:
* tidy_data.txt: contains all the merged data from the analyisis
* tidy_data_means.txt: contains the tidy data set with the average of each variable for each activity and each subject.


