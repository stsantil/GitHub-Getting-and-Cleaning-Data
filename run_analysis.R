## 1. Merging of the training and test sets to create one data set
  
  ## Imports the relevant data tables
  features<-read.table("~/UCI HAR Dataset/features.txt")
  activity_labels<-read.table("~/UCI HAR Dataset/activity_labels.txt", col.names=c("Activity.Code", "Activity"))
  X_test<-read.table("~/UCI HAR Dataset/test/X_test.txt")
  y_test<-read.table("~/UCI HAR Dataset/test/y_test.txt", col.names="Activity.Code")
  subject_test<-read.table("~/UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
  X_train<-read.table("~/UCI HAR Dataset/train/X_train.txt")
  y_train<-read.table("~/UCI HAR Dataset/train/y_train.txt", col.names="Activity.Code")
  subject_train<-read.table("~/UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
  
  ## Merges the test and training data files and assignes the column names from the "features" file
  X_full <- rbind(X_test, X_train)
  colnames(X_full) <- make.names(features[,2], unique=T)
  y_full <- rbind(y_test, y_train)
  subject_full <- rbind(subject_test, subject_train)
  full_dataset <- cbind(subject_full, y_full, X_full)
 
   
## 2. Extracts only the measurements on the mean and standard deviation for each measurement
  library(dplyr)
  dataset_m_sd <- select(full_dataset, Activity.Code, Subject, contains("mean"), contains("std"), -contains("meanF")) 

  
## 3. Uses descriptive activity names to name the activities in the data set
  dataset_m_sd<-merge(dataset_m_sd,activity_labels, by.x = "Activity.Code", by.y = "Activity.Code")
  dataset_m_sd<-select(dataset_m_sd, Activity, Subject, everything(), -Activity.Code)

    
## 4. Appropriately lable the data set with descriptive variable names
  colnames(dataset_m_sd)<-gsub("tBo","TimeBo",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("tGr","TimeGr",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("fBo","FrequencyBo",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("fGr","FrequencyGr",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Acc","Accelerometer",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Gyro","Gyroscope",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Mag","Magnitude",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("std","StandardDeviation",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("...X","X",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("...Y","Y",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("...Z","Z",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Mean...","Mean",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("mean..","Mean",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Mean.","Mean",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("angX","angleX",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("angY","AngleY",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("angZ","AngleZ",colnames(dataset_m_sd))
  colnames(dataset_m_sd)<-gsub("Deviation..","Deviation",colnames(dataset_m_sd))
 
   
## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
  
  tidy_dataset <- dataset_m_sd %>% group_by(Activity, Subject) %>% summarize_each(funs(mean))
  write.table(tidy_dataset,"tidy_dataset.txt", row.name=FALSE)