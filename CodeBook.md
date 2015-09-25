---
title: "CodeBook"
author: "Stefano Santilli"
date: "September 25, 2015"
---

#Coursera - Getting and Cleaning Data Course - Project Assignment

-----------------------------------------------------------------------------------------

###The Project for the Course provided the required data files and included the following instructions:

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each  variable for each activity and each 
subject.

-----------------------------------------------------------------------------------------

###The output of the project includes the following files:

- 'README.md': A Markdown file decribing and explaining the code script

- 'run_analysisR.txt': Code script

- 'tidy_dataset.txt': final tidy dataset as indicated in point 5 of the instructions.

- 'CodeBook.md': (this file) A Markdown file describing variables, data and transformations performed.

-----------------------------------------------------------------------------------------

###Description of Variables, Data and Transformations

The dataset included in the 'tidy_dataset.txt' file s a tidy dataset that meets the 3 key principles of tidy datasets indicated in Wickham's paper: "1. Each variable forms a column. 2. Each observation forms a row. 3. Each type of observational unit forms a table." This dataset is the long form as mentioned in the rubric, since either long or wide form is acceptable for the project.

The columns are the following:

- The first two pertain to "fixed variables"

-- Activity: this variable indicates the activity performed by the subject and monitored for the study. There are six different values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. The original dataset included codes for the activities, while a separate file, "activity.labels.txt" included the labels describing the activities.Merging the tables allowed the retrieval of the labels for the final dataset.

-- Subject: This variable represent a numeric identifier for the subject performing the activity. It is a number from 1 to 30. The original datasets came as a training dataset, which contained 70% of the data (and therefore 21 subjects), and a testing dataset, with the remaining 30% of the data (9 subjects). The two datasets were merged into a comprehensive one containg both training and testing data.

- The remaining columns all contain mean values for the corresponding measurements, grouped by the two fixed variables above:

TimeBodyAccelerometer.meanX
TimeBodyAccelerometer.meanY
TimeBodyAccelerometer.meanZ
TimeGravityAccelerometer.meanX
TimeGravityAccelerometer.meanY
TimeGravityAccelerometer.meanZ
TimeBodyAccelerometerJerk.meanX
TimeBodyAccelerometerJerk.meanY
TimeBodyAccelerometerJerk.meanZ
TimeBodyGyroscope.meanX
TimeBodyGyroscope.meanY
TimeBodyGyroscope.meanZ
TimeBodyGyroscopeJerk.meanX
TimeBodyGyroscopeJerk.meanY
TimeBodyGyroscopeJerk.meanZ
TimeBodyAccelerometerMagnitude.Mean
TimeGravityAccelerometerMagnitude.Mean
TimeBodyAccelerometerJerkMagnitude.Mean
TimeBodyGyroscopeMagnitude.Mean
TimeBodyGyroscopeJerkMagnitude.Mean
FrequencyBodyAccelerometer.meanX
FrequencyBodyAccelerometer.meanY
FrequencyBodyAccelerometer.meanZ
FrequencyBodyAccelerometerJerk.meanX
FrequencyBodyAccelerometerJerk.meanY
FrequencyBodyAccelerometerJerk.meanZ
FrequencyBodyGyroscope.meanX
FrequencyBodyGyroscope.meanY
FrequencyBodyGyroscope.meanZ
FrequencyBodyAccelerometerMagnitude.Mean
FrequencyBodyBodyAccelerometerJerkMagnitude.Mean
FrequencyBodyBodyGyroscopeMagnitude.Mean
FrequencyBodyBodyGyroscopeJerkMagnitude.Mean
angle.TimeBodyAccelerometerMeanvity.
angle.TimeBodyAccelerometerJerkMeanavityMean
angle.TimeBodyGyroscopeMeanvityMean
angle.TimeBodyGyroscopeJerkMeanvityMean
angleX.gravityMean
AngleY.gravityMean
AngleZ.gravityMean
TimeBodyAccelerometer.StandardDeviationX
TimeBodyAccelerometer.StandardDeviationY
TimeBodyAccelerometer.StandardDeviationZ
TimeGravityAccelerometer.StandardDeviationX
TimeGravityAccelerometer.StandardDeviationY
TimeGravityAccelerometer.StandardDeviationZ
TimeBodyAccelerometerJerk.StandardDeviationX
TimeBodyAccelerometerJerk.StandardDeviationY
TimeBodyAccelerometerJerk.StandardDeviationZ
TimeBodyGyroscope.StandardDeviationX
TimeBodyGyroscope.StandardDeviationY
TimeBodyGyroscope.StandardDeviationZ
TimeBodyGyroscopeJerk.StandardDeviationX
TimeBodyGyroscopeJerk.StandardDeviationY
TimeBodyGyroscopeJerk.StandardDeviationZ
TimeBodyAccelerometerMagnitude.StandardDeviation
TimeGravityAccelerometerMagnitude.StandardDeviation
TimeBodyAccelerometerJerkMagnitude.StandardDeviation
TimeBodyGyroscopeMagnitude.StandardDeviation
TimeBodyGyroscopeJerkMagnitude.StandardDeviation
FrequencyBodyAccelerometer.StandardDeviationX
FrequencyBodyAccelerometer.StandardDeviationY
FrequencyBodyAccelerometer.StandardDeviationZ
FrequencyBodyAccelerometerJerk.StandardDeviationX
FrequencyBodyAccelerometerJerk.StandardDeviationY
FrequencyBodyAccelerometerJerk.StandardDeviationZ
FrequencyBodyGyroscope.StandardDeviationX
FrequencyBodyGyroscope.StandardDeviationY
FrequencyBodyGyroscope.StandardDeviationZ
FrequencyBodyAccelerometerMagnitude.StandardDeviation
FrequencyBodyBodyAccelerometerJerkMagnitude.StandardDeviation
FrequencyBodyBodyGyroscopeMagnitude.StandardDeviation
FrequencyBodyBodyGyroscopeJerkMagnitude.StandardDeviation

As indicated for the Subject variable, the original datasets came as a training dataset, which contained 70% of the data, and a testing dataset, with the remaining 30% of the data. The two datasets were merged into a comprehensive one containg both training and testing data. Such comprehensive dataset included many more measurements (e.g. max, min, skewness, kurtosis) which were not relevant for the assignment. Therefore, they were dropped and only the variables related to means and standard deviations were retained. 
A file provided for the project ("features.txt" contained the original labels for the measurement variables, which made large use of abbreviations. A detailed description of such variables was provided in "features_info.txt". On the basis of this description, it was possible to convert the original labels into more descriptive column names (e.g. replacing "t" with "time", "f" with "frequency", "Acc" with "Accelerometer", etc.).

The final tidy dataset contains 75 columns (2 fixed + 75 measurements) and 180 observations (6 activities x 30 subjects) and was exported as a txt file ("tidy_dataset.txt").


