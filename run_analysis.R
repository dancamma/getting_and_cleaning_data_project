library(dplyr)
library(stringr)

#READ DATA

#list of features
features <- read.table('UCI HAR Dataset/features.txt', sep = ' ', col.names=c('names','feature'))
activities <- read.table('UCI HAR Dataset/activity_labels.txt', sep = ' ', col.names=c('activity', 'activityName'))

#training set
trainX <- read.table('UCI HAR Dataset/train/X_train.txt')
names(trainX) <- features$feature
trainY <- read.table('UCI HAR Dataset/train/y_train.txt', col.names=c('activity'))
trainSubject <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('subjectId'))

#test set
testX <- read.table('UCI HAR Dataset/test/X_test.txt')
names(testX) <- features$feature
testY <- read.table('UCI HAR Dataset/test/y_test.txt', col.names=c('activity'))
testSubject <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('subjectId'))

#joining tables
train <- cbind(trainSubject, trainX, trainY)
test <- cbind(testSubject, testX, testY)

#merging training and test
data <- rbind(train, test)


#Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- data %>% select(subjectId, contains('-std\\('), contains('-mean\\('), activity)

#Uses descriptive activity names to name the activities in the data set
data <- merge(data,activities,by='activity')
data$activityName <- factor(data$activityName)
data <- data %>% select(-activity)

#Appropriately labels the data set with descriptive variable names. 
names(data) <- str_replace_all(names(data),"\\(\\)","")

write.table(data, 'tidy_data.txt', row.name = F)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data <- group_by(data, subjectId, activityName)
data <- summarise_each(data,funs(mean))
write.table(data, 'tidy_data_means.txt', row.name = F)


