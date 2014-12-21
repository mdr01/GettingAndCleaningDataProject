# README

## Tidy data for Human Activity Recognition Using Smartphones Dataset

# SUMMARY

# Tidy data for Human Activity Recognition Using Smartphones Dataset

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years, and the data catalogued by UCI. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity, were captured at a constant rate of 50Hz.

As part of a project for Coursera course Getting and Cleaning Data, the data of UCI was considered raw data set and then transformed into a tidy data set. 

The raw data set was transformed from a total 563 columns by 10299 rows to a tidy data set with 81 columns by 180 rows. The transformations are described in Codebook.md.

# FILES
Codebook.md:
	Described the transformations used to convert the raw data set to a tidy data set.

run_analysis.R:
	R script that performs the transformation

mygrep.R:
	Helper function
	
HAR_TidyDataIntermediate.txt: 
	Intermediate tidy data set without average for each subject and each activity  

HAR_TidyData.txt: 
	Final tidy data set with average for each subject and each activity  

The following files are part of the raw data set. See README.txt for their description.

Readme.txt

features_info.txt: 
	Shows information about the variables used on the feature vector.

features.txt: 
	List of all features.

activity_labels.txt: 
	Links the class labels with their activity name.

train/X_train.txt: 
	Training set.

train/y_train.txt: 
	Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

	
 