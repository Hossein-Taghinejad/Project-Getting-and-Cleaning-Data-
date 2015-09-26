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
