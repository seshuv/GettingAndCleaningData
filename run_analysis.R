# # The data is at ./UCI HAR Dataset, downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# #
# # This is the R script that does:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Merge teh training and the test sets to create one dataset
train_x <- read.table("train/X_train.txt")
test_x <- read.table("test/X_test.txt")
x_data <- rbind(train_x, test_x)

train_subject <- read.table("train/subject_train.txt")
test_subject <- read.table("test/subject_test.txt")
subject_data <- rbind(train_subject, test_subject)

train_y <- read.table("train/y_train.txt")
test_y <- read.table("test/y_test.txt")
y_data <- rbind(train_y, test_y)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
good_feature_indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_data <- x_data[, good_feature_indices]
names(x_data) <- features[good_feature_indices, 2]
names(x_data) <- tolower(gsub("\\(|\\)", "", names(x_data)))

# Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- gsub("_", "", tolower(as.character(activity_labels[, 2])))
y_data[,1] <- activity_labels[y_data[,1], 2]
names(y_data) <- "activity"

# Appropriately labels the data set with descriptive variable names. 
names(subject_data) <- "subject"
merged_data <- cbind(subject_data, y_data, x_data)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
num_unique_activity_labels <- length(unique(activity_labels)[,1])
uniqueSubjects <- unique(subject_data)[,1]
num_unique_subjects <- length(uniqueSubjects)

num_cols <- dim(merged_data)[2]
tidy_data_set <- merged_data[1:(num_unique_activity_labels*num_unique_subjects),]

row <- 1
for (s in 1:num_unique_subjects) {
    for (a in 1:num_unique_activity_labels) {
        tidy_data_set[row, 1] <- uniqueSubjects[s]
        tidy_data_set[row, 2] <- activity_labels[a, 2]
        tmp <- merged_data[merged_data$subject == s & merged_data$activity == activity_labels[a, 2], ]
        tidy_data_set[row, 3:num_cols] <- colMeans(tmp[, 3:num_cols])
        row <- row+1
    }
}
write.table(tidy_data_set, "tidy_data_set_with_averages.txt", row.names=FALSE)
