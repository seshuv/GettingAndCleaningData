# Course Project Code Book

This is for the code project in the Getting and Cleaning Data as part of Data Science course from Johns Hopkins Univ.
The purpose of this project is to get the data from different sources and prepare a tidy data set using the R code.

## Data
   The data is explained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   The data is obtained from here:
      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
      

## Code
### Merge teh training and the test sets to create one dataset
   Reads the data in 'train' and 'test' directories.  The following files are read using 'read.table'.
      X_train.txt           X_test.txt
      y_train.txt           y_test.txt
      subject_train.txt     subject_test.txt
      
   Then it uses the 'rbind' method to merge the data accordingly.
    
### Extracts only the measurements on the mean and standard deviation for each measurement.
   It reads the 'features.txt' and greps for 'mean' and 'std' deviation to get the columns of interst.
    
### Uses descriptive activity names to name the activities in the data set
   It reads the 'activity_labels.txt' using read.table and massages the y_data names.
    
### Appropriately labels the data set with descriptive variable names. 
  It merges the 3 different data sets using 'cbind'.
  
### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Finds the unique items in the data sets and loops thorugh 'activity labels' and 'subjects' to create the tidy merge dataset that is required.
  
  
      
