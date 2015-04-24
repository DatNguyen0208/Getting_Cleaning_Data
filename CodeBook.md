Source of the original data:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The attached R script (run_analysis.R) performs the following to clean up the data:

+ Merges the training and test sets to create one data set, 
namely X_train.txt with X_test.txt,the result of Which is X_total data frame,
subject_train.txt with subject_test.txt, the result of which is a Sub_total data frame with subject IDs, 
and y_train.txt with y_test.txt, the result of which is also a Y_total data frame with activity IDs.

+ Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 
Only 66 out of 561 attributes are measurements on the mean and standard deviation. 

+ Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

	walking
	
	walkingupstairs
	
	walkingdownstairs
	
	sitting
	
	standing
	
	laying
	
+ The script also appropriately labels the data set with descriptive names: all feature names (attributes) 
and activity names are converted to lower case.  
The result is saved as "clean_final_data.txt". The names of the attributes are similar to the following:

	tbodyacc-mean-x 

	tbodyacc-mean-y 
	
	tbodyacc-mean-z 
	
	tbodyacc-std-x 
	
	tbodyacc-std-y 
	
	tbodyacc-std-z 
	
	tgravityacc-mean-x 
	
	tgravityacc-mean-y
	
+ Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as dataset2.txt
