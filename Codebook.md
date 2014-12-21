# CODEBOOK

## Tidy data for Human Activity Recognition Using Smartphones Dataset


## VARIABLES

### ID
	Unique identifiers for subjects who participated in the study

### ACTIVITY
Activity is a factor that takes one of six classifications - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS ,SITTING, STANDING, LAYING

### FEATURES
Time-domain signal have prefix ’t’
Frequency-domain signal have prefix ‘f’
Body signals have ‘Body’ in their name 
Gravitational signals have ‘Gravity’ in their name
Jerk signals have ‘Jerk’ or ‘Gyro’ in their name
Mean values have ‘mean’ in their name
Standard deviation values have ‘std’ in their name


### TRANSFORMATIONS

The raw data set contains 561-feature vector. In all, the raw data set had a total 563 column (561-feature vector + subject IDs + activity label). The raw data was separated into two sets - training data set and testing data set. Each set included multiple observations for each subject, for a total of 10299 rows.

The raw data was transformed to a considerably smaller tidy data set in two ways; 
(1) Only columns that have mean and standard deviation values of the feature vectors were kept, reducing the total number of columns from 563 to 81 (big reduction). 
(2) The mean data for each subject and for each activity was calculated, after combining the training and testing data sets, reducing the number of rows to 180 (an even bigger reduction)

The transformations included the following:
- Character "-" in the column names was replaced by "_" to avoid confusion with subtraction
- Character “()” in the column names was replaced by “” to avoid confusion with a function call
- Textual activity labels, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, were used instead on numbers.
- Only column with mean or standard deviation were retained
- Training and Testing data sets were combined.
- Combined data set was sorted by subject ID. This is the first tidy data set (HAR_TidyDataIntermediate.txt)
- Combined data set was processed further to obtain average data for each subject and for each activity. This results in the final data set (HAR_TidyData.txt)
- 