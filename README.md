# Project of Getting and Cleaning Data 2014

## Where is the data from

The data was provided from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset was obtained from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
as the data for the project of the coursera mooc course Getting and Cleaning Data in November 2014.

The description of the given data is in the section _Data Readme_ of this document.

## How the script works

The outline of the script in the file `run_analysis.R` is according to the description of the task of the project.

1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names. 
5.    From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In detail:

It is assumed, that the given dataset is in the subdirectory `UCI HAR Dataset` of the current directory.
That directory is created when unpacking the given data set.
Run the function doall() to do all reading and calculations:
    source("run_analysis.R")
    `result <- doall()`

The following functions are defined:

    doall()

wraps the two main steps of reading the data (step 1 to 4 of the above list) and calculating the averages (step 5). It returns the table with the averages.

    readfile(filename)

is a helper function that reads the file with the name given by the parameter in the subdirectory `UCI HAR Dataset` and
returns the content as a data table.

    readall()

does the reading of the given data out of the text files.
The `activityLabels` is the mapping of an id to the desciptive name of the activity.

`features` is the list of the names of the variables of the measurements.

The actual data is within 3 files. The measurements are in the files X\_test.txt and X\_train.txt.
The measurements are mapped by the files subject\_test.txt and subject\_train.txt to the subject of the measurement and by the files y\_test.txt and y\_train.txt to the activity during which the measurements where taken. Therefore the test data is the combination by `cbind` of the data of the 3 files and 
the training data respectively.

The id of the activities is substituted by the given name in `activityLabels`.

The test data and the training data are concatenated by `rbind`.

Of the resulting data frame only the measurements variables of means (containing `mean()` in its name)
and standard deviation (containg `std()` in its name) are selected. The selected columns are the resulting data of the function.

    calcAverages(mydata)

Grouped by the subject and the activity the averages of the variables are aggregated.
The resulting data frame is arranged according to subject and activity for better human reading.
The data frame is written to a file for uploading the data to coursera.


## Code Book

Code Book of the resulting data frame of the last step:

The data.frame has 10299 observations of 68 variables:

subject
identifies the subject, of which the observations were made, by a unique integer

activity
denotes the activity, during which the measurements were done.

6 activities are identified by their name, see second column:

1	WALKING
2	WALKING_UPSTAIRS
3	WALKING_DOWNSTAIRS
4	SITTING
5	STANDING
6	LAYING

The following columns hold the averages of the variables described in 
the section _Data Readme_ of this document. The variable names are changed in the following way:
- Every minus sign (`-`) is converted to the underline character.
- Braces are deleted.
- In the result table with the averages every variable name is preceeded by `average\_of\_` .

The names of the result table are then:

 [1] "subject"                              
 [2] "activity"                             
 [3] "average_of_ tBodyAcc_mean_X"          
 [4] "average_of_ tBodyAcc_mean_Y"          
 [5] "average_of_ tBodyAcc_mean_Z"          
 [6] "average_of_ tBodyAcc_std_X"           
 [7] "average_of_ tBodyAcc_std_Y"           
 [8] "average_of_ tBodyAcc_std_Z"           
 [9] "average_of_ tGravityAcc_mean_X"       
[10] "average_of_ tGravityAcc_mean_Y"       
[11] "average_of_ tGravityAcc_mean_Z"       
[12] "average_of_ tGravityAcc_std_X"        
[13] "average_of_ tGravityAcc_std_Y"        
[14] "average_of_ tGravityAcc_std_Z"        
[15] "average_of_ tBodyAccJerk_mean_X"      
[16] "average_of_ tBodyAccJerk_mean_Y"      
[17] "average_of_ tBodyAccJerk_mean_Z"      
[18] "average_of_ tBodyAccJerk_std_X"       
[19] "average_of_ tBodyAccJerk_std_Y"       
[20] "average_of_ tBodyAccJerk_std_Z"       
[21] "average_of_ tBodyGyro_mean_X"         
[22] "average_of_ tBodyGyro_mean_Y"         
[23] "average_of_ tBodyGyro_mean_Z"         
[24] "average_of_ tBodyGyro_std_X"          
[25] "average_of_ tBodyGyro_std_Y"          
[26] "average_of_ tBodyGyro_std_Z"          
[27] "average_of_ tBodyGyroJerk_mean_X"     
[28] "average_of_ tBodyGyroJerk_mean_Y"     
[29] "average_of_ tBodyGyroJerk_mean_Z"     
[30] "average_of_ tBodyGyroJerk_std_X"      
[31] "average_of_ tBodyGyroJerk_std_Y"      
[32] "average_of_ tBodyGyroJerk_std_Z"      
[33] "average_of_ tBodyAccMag_mean"         
[34] "average_of_ tBodyAccMag_std"          
[35] "average_of_ tGravityAccMag_mean"      
[36] "average_of_ tGravityAccMag_std"       
[37] "average_of_ tBodyAccJerkMag_mean"     
[38] "average_of_ tBodyAccJerkMag_std"      
[39] "average_of_ tBodyGyroMag_mean"        
[40] "average_of_ tBodyGyroMag_std"         
[41] "average_of_ tBodyGyroJerkMag_mean"    
[42] "average_of_ tBodyGyroJerkMag_std"     
[43] "average_of_ fBodyAcc_mean_X"          
[44] "average_of_ fBodyAcc_mean_Y"          
[45] "average_of_ fBodyAcc_mean_Z"          
[46] "average_of_ fBodyAcc_std_X"           
[47] "average_of_ fBodyAcc_std_Y"           
[48] "average_of_ fBodyAcc_std_Z"           
[49] "average_of_ fBodyAccJerk_mean_X"      
[50] "average_of_ fBodyAccJerk_mean_Y"      
[51] "average_of_ fBodyAccJerk_mean_Z"      
[52] "average_of_ fBodyAccJerk_std_X"       
[53] "average_of_ fBodyAccJerk_std_Y"       
[54] "average_of_ fBodyAccJerk_std_Z"       
[55] "average_of_ fBodyGyro_mean_X"         
[56] "average_of_ fBodyGyro_mean_Y"         
[57] "average_of_ fBodyGyro_mean_Z"         
[58] "average_of_ fBodyGyro_std_X"          
[59] "average_of_ fBodyGyro_std_Y"          
[60] "average_of_ fBodyGyro_std_Z"          
[61] "average_of_ fBodyAccMag_mean"         
[62] "average_of_ fBodyAccMag_std"          
[63] "average_of_ fBodyBodyAccJerkMag_mean" 
[64] "average_of_ fBodyBodyAccJerkMag_std"  
[65] "average_of_ fBodyBodyGyroMag_mean"    
[66] "average_of_ fBodyBodyGyroMag_std"     
[67] "average_of_ fBodyBodyGyroJerkMag_mean"
[68] "average_of_ fBodyBodyGyroJerkMag_std" 


The following section is included from the Readme of the given data set.

## Data Readme

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

