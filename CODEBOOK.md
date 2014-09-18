## codebook.md

## Description of the data components

For original description of the raw data see:

* _\UciHarDataset\README.txt, features_info.txt_

### Structure of the final dataset

see: **TidyStructure.jpg** 

![Tidy dataset](TidyStructure.jpg)


---------------
### KEYS:
#### SubjectId

 source of raw data:   

* subject_train.txt  
* subject_test.txt  

Integer numbers 1:30  
Part of them (randomly) comes from the "train" data  
The other part is from the "test"

#### ActivityId

Numeric id of the activities.

**Set of values:**

Integer numbers 1:6

source of raw data: 

* y_train.txt (training activity labels)
* y_test.txt (test activity labels)


#### Activity
	
Descriptive name of the ActivityId values
source of raw data: 

* activity_labels.txt  (it links the ActivityIds with their activity name)

**Set of values:**

WALKING  
WALKING_UPSTAIRS  
WALKING_DOWNSTAIRS  
SITTING  
STANDING  
LAYING

---------------

### VARIABLES:

#### Features
source of raw data: 

* features.txt

tidy variable names: _Feature names has been turned to "camelCaseFormat" for easier reading.  
For the complete list of the variables see the end of this file._
			
#### Measurement data
source of raw data: 

* X_train.txt (training sets)
* X_test.txt (test sets)
		
--------------------------
## Analysis and process summary

**STEP1** - process train data

* merge ActivityIds with descriptive Activity names
* bind SubjectIds with ActivityId/Activity columns and measurement data (X_train)

**STEP2** - process test data

* merge ActivityIds with descriptive Activity names  
* bind SubjectIds with ActivityId/Activity columns and measurement data (X_test)
		
**STEP3** - combine and "tidyfy" the two datasets

* add descriptive names to each columns (features)
* drop all variable columns named other than mean() or std()
* group the tidy dataset by SubjectId and Activity (name) and calculate the average (mean) of each variable column

-------------------	
## Notes

The "InertialSignals" data was not used during the analysis and the construction of the tidy data set.


-------------------------------------------
### Complete list of tidy variable names:

tBodyAccMeanX  
tBodyAccMeanY  
tBodyAccMeanZ  
tGravityAccMeanX  
tGravityAccMeanY  
tGravityAccMeanZ  
tBodyAccJerkMeanX  
tBodyAccJerkMeanY  
tBodyAccJerkMeanZ  
tBodyGyroMeanX  
tBodyGyroMeanY  
tBodyGyroMeanZ  
tBodyGyroJerkMeanX  
tBodyGyroJerkMeanY  
tBodyGyroJerkMeanZ  
tBodyAccMagMean  
tGravityAccMagMean  
tBodyAccJerkMagMean  
tBodyGyroMagMean  
tBodyGyroJerkMagMean  
fBodyAccMeanX  
fBodyAccMeanY  
fBodyAccMeanZ  
fBodyAccJerkMeanX  
fBodyAccJerkMeanY  
fBodyAccJerkMeanZ  
fBodyGyroMeanX  
fBodyGyroMeanY  
fBodyGyroMeanZ  
fBodyAccMagMean  
fBodyBodyAccJerkMagMean  
fBodyBodyGyroMagMean  
fBodyBodyGyroJerkMagMean  
tBodyAccStdX  
tBodyAccStdY  
tBodyAccStdZ  
tGravityAccStdX  
tGravityAccStdY  
tGravityAccStdZ  
tBodyAccJerkStdX  
tBodyAccJerkStdY  
tBodyAccJerkStdZ  
tBodyGyroStdX  
tBodyGyroStdY  
tBodyGyroStdZ  
tBodyGyroJerkStdX  
tBodyGyroJerkStdY  
tBodyGyroJerkStdZ  
tBodyAccMagStd  
tGravityAccMagStd  
tBodyAccJerkMagStd  
tBodyGyroMagStd  
tBodyGyroJerkMagStd  
fBodyAccStdX  
fBodyAccStdY  
fBodyAccStdZ  
fBodyAccJerkStdX  
fBodyAccJerkStdY  
fBodyAccJerkStdZ  
fBodyGyroStdX  
fBodyGyroStdY  
fBodyGyroStdZ  
fBodyAccMagStd  
fBodyBodyAccJerkMagStd  
fBodyBodyGyroMagStd  
fBodyBodyGyroJerkMagStd  



