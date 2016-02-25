he goal is to prepare tidy data that can be used for later analysis. One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ]

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ]

We should create one R script called run_analysis.R that does the following:
1.Merges the training and the test sets to create one data set.   
2.Extracts only the measurements on the mean and standard deviation for each measurement.    
3.Uses descriptive activity names to name the activities in the data set.   
4.Appropriately labels the data set with descriptive variable names.    
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.    



We are assuming that we have the current files in the working directory:
1.subject_test
2.X_test
3.y_test
4.features
5.subject_train
6.X_train
7.y_train

First we make a data.frame including the data related to the test case. We call it main.test. To do that first we put the feature names in the column names of X-test then we cbind the result with subject-test and y-test.

Second we do the same task on train cases.

Then we rbind the results from previous cases and we subset the resulting data.frame such that the column names only include mean and std.

Then we take the mean by using ddply and at the end we change the labels for the activity.
