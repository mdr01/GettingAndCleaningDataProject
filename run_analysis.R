# run_analysis.R
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.

# source supporting function
source("mygrep.R")

#
# 1. Merges the training and the test sets to create one data set.
#

# TRAINING DATA
# (a) subject ids
fileName1<-"subject_train.txt"
id<-read.table(fileName1)

# (b) features
fileName2<-"X_train.txt"
Features<-read.table(fileName2)

# (c) activity labels
fileName3<-"y_train.txt"
labels<-read.table(fileName3)

# (d) labels for features
fileName4<-"features.txt"
featlab<-read.table(fileName4)
temp1<-sub("-","_",sub("-","_",featlab$V2)) # replace "-" by "_" to avoid confusion with subtraction
temp2<-sub("[(]","",sub("[(]","",temp1)) # replace "(" by "" to avoid confusion with function call
temp3<-sub("[)]","",sub("[)]","",temp2)) # replace "(" by "" to avoid confusion with function call
FeatureLabels<-temp3

ID<-as.factor(id$V1) # subject ID is a factor
Activity<-as.factor(labels$V1) # Activity labels is a factor

# Provide meaningful names
names(Features)<-FeatureLabels

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colNames<-names(Features)

Imean<-mygrep("mean",colNames) # identify column heading with "mean" in their name
Istd<-mygrep("std",colNames) # identify column heading with "std" in their name
I<-(Imean | Istd)

Features2<-Features[,I] # table with only mean and std data

# (e) labels for activity
fileName5<-"activity_labels.txt"
activity_labels<-read.table(fileName5)
levels(Activity)<-activity_labels$V2

# Create one table that includes ID, Activity and features for the TRAINING group
TrainingData<-cbind(ID,Activity,Features2)


# clean up environment by removing some variable
rm(fileName1,fileName2,fileName3,fileName4)
rm(id,labels,featlab)
rm(ID,Activity,Features,Features2)
# END TRAINING

# TESTING DATA
# (a) subject ids
fileName1<-"subject_test.txt"
id<-read.table(fileName1)

# (b) features
fileName2<-"X_test.txt"
Features<-read.table(fileName2)

# (c) activity labels
fileName3<-"y_test.txt"
labels<-read.table(fileName3)

# (d) labels for features
# Use feature labels for training data

ID<-as.factor(id$V1) # subject ID is a factor
Activity<-as.factor(labels$V1) # Activity labels is a factor
levels(Activity)<-activity_labels$V2

# Provide meaningful names
names(Features)<-FeatureLabels

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Features2<-Features[,I] # table with only mean and std data


# Create 1 table that includes ID, Activity and features for the TESTING group
TestingData<-cbind(ID,Activity,Features2)

# clean up environment by removing some variable
rm(fileName1,fileName2,fileName3)
rm(id,labels)
rm(ID,Activity,Features)
# END TESTING

# TRAINING + TESTING DATA
# Combine Training and Testing datasets
combinedData<-rbind(TrainingData,TestingData) # combinedData contains all the measurements

# sort combinedData by subject ID
combinedData<-combinedData[order(as.numeric(as.character(combinedData$ID))),]


# Now the tough part begins
# Find the mean and std (across repeated measurements for each subject)
TrainTestData<-aggregate(combinedData[,3:length(combinedData)],by=list(combinedData$ID,combinedData$Activity), mean)
TrainTestData<-TrainTestData[order(as.numeric(as.character(TrainTestData$Group.1))),]
names(TrainTestData)[1]<-"ID"
names(TrainTestData)[2]<-"Activity"

# write tidy data to .txt file
write.table(combinedData,file="HAR_TidyDataIntermediate.txt",row.name=FALSE)
write.table(TrainTestData,file="HAR_TidyData.txt",row.name=FALSE)
