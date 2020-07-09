# datasciencecoursera
This repo contains the final project file for "Getting and Cleaning Data" course on coursera.

Run_analysis.R is the file that contains the code to clean a dataset, including adding names and extracting mean and standard deviations from the observations, and outputting that new, tidy data set into a text file.

The dataset is UCI HAR Dataset, as specified by the course, and can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The task of outputting a tidy data set was split into the following steps in the script run_analysis.R:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
