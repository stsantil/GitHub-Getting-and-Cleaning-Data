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

- 'README.md': (this file) A Markdown file decribing and explaining the code script

- 'run_analysisR.txt': Code script

- 'tidy_dataset.txt': final tidy dataset as indicated in point 5 of the instructions.

- 'CodeBook.md': Code Book describing variables, data and transformations performed.

-----------------------------------------------------------------------------------------

###Code Description

The Code script generally follows the order of required steps indicated in the instructions above, even though in some cases the code reflects in earlier lines some requirements that pertain to subsequent steps (e.g. the naming of the fields of certain files when the data is imported). Reflecting the instructions, the code is organized in 5 steps as follows:

- Step 1, corresponding to the instruction "1. Merges the training and the test sets to create one data set."

This step begins with the importing of all the relevant data tables (features; X,Y and suject data for both the testing and training sets). 
The corresponding data frames are subsequently merged and column names are assigned to the comprehensive data set. 

- Step 2, corresponding to the instruction "2. Extracts only the measurements on the mean and standard deviation for each measurement." 

This steps starts by calling the library dplyr, which allows to use the "select" command in order to create the "dataset_m_sd" data frame, which includes only the columns pertaining to files containing mean and standard deviation measurements. This is achieved by performing a string search for the words "mean" and "std". Since some fields contain the word "mean", but refer to the meanFrequency, such fields are excluded utilizing the string "meanF" to identify them.

- Step 3, corresponding to the instruction "3. Uses descriptive activity names to name the activities in the data set."

This step merges the comprehensive dataset with the activity labels frame by using the common key of the activity codes (Activity.Code), in order to get the activity names.Subsequently, it reorders the columns in the comprehensive dataset by having the "fixed variables" Activity and Subject first (per Wickham's paper) and the measured variables after them. The Activity.Code column is dropped, since it is now redundant.

- Step 4, corresponding to the instruction "4. Appropriately labels the data set with descriptive variable names." 

This step performs a series of text replacements in the names of the columns in the dataset, based on information available in the "features_info.txt" file provided. For example, it interprets (and substitutes accordingly) "t" as "time", "f" as "frequency", "Acc" as "Accelerometer", etc. In addition, it performs some cleaning up of dots in the column names in order to make them more readable.

- Step 5, corresponding to the instruction "5. From the data set in step 4, creates a second, independent tidy data set with the 		
average of each variable for each activity and each subject.

This final step creates a new tidy dataset ("tidy_dataset") with the average of each variable for each activity and subject. The group_by function is utilized for the two fixed variables (activity and subject). Then the summarize_each functions is employed to calcuate the mean of all the measured variables.The resulting dataset is tidy because it meets the 3 key principles of tidy datasets indicated in Wickham's paper: "1. Each variable forms a column. 2. Each observation forms a row. 3. Each type of observational unit forms a table." This dataset is the long form as mentioned in the rubric, as either long or wide form is acceptable for the project.
Finally, the tidy dataset is exported to a txt file ("tidy_dataset.txt") which is then submitted as a key project output.Please refer to the Codebook for a detailed description of the tidy dataset content.
