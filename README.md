# GettingAndCleaningData
Getting and Cleaning Data course repository

## How to run

### Get the data
'wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
unzip the data in the same directory where 'run_analysis.R' file is available.  The R script expects 'train' and 'test' directories to be in the same directory as the 'run_analysis.R' along with other data.

### Run the script
Run 'run_analysis.R' script. 

### Output
It generates 'tidy_data_set_with_averages.txt' in the same direcotry.
There are 6 activities and 30 subjects.  The output has data for each activity and for each subject.

