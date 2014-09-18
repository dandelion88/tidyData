## README.md

The solution consists of two functions:

1. `run_analysis ()` - the master function 
2. `read_observations ()` - the utility function responsible for reading the observations (train and test) and for preparing the raw dataset for each

The source code of the two functions is uploaded in one single file named: **run_analysis.R**

Call sequence when running from the root of the original data set:
		`result <- run_analysis ()`

See help text for both functions below. Additional comments can be found in the **_run\_analysis.R_** file.


--------------------------------
**run_analysis()**

### Description

`run_analysis()` is the master function for reading and tidying the Samsung master data in Course Project. It can be launched with up to 3 arguments. In order to get the "train" and "test" measurement data it calls the `read_observations()` function 2 times. The raw datasets provided by `read_observations()` is "tidyfied" by the `run_analysis()`.

### Usage
`run_analysis (rootDir=getwd(), 
				trainDir="train", testDir="test")`


### Arguments
`p_rootDir` 	a character string naming the location of common data
 	
`p_trainDir`	a character string naming the directory containing the "train" data. Default: "train"

`p_testDir`	a character string naming the directory containing the "test" data. Default: "test"


### Value

The function returns a tidy data.frame object containing the "mean" and "std" variables averaged by SubjectId+Activity(name) key combinations


### Details

If no arguments are provided source data is searched at its standard location (i.e. common data in the current work directory, and measurement data in their default sub directories

By providing any combination of the arguments the function can search for the data files in the given directories


### Note

Warning: NO error handling is implemented! Be careful to set valid and existing directory names!


### Examples

Simplest form: source data is located in the work directory and its standard subdirectories:
`result <- run_analysis ()`

Source data is located in a different directory under Home:
`result <- run_analysis ("samsung_data")`

Source data is located at any other (non standard) locations
(all three parameters are provided):
`result <- run_analysis 
	("samsung_common_data","samsung_train","samsung_test")`


	
		
--------------------------------
**read\_observations()**

### Description

`read_observations()` is the function to read raw data from the directory defined by its attributes. The function needs the activity labels (p_activityLabels) and merges it with the yData through the activity IDs. Finally, yData is combined with the xData by columns.

### Usage
`read_observations <- function 			
	(p_obsDir,p_dataset,p_activityLabels)`


### Arguments
`p_obsDir` 	a character string naming the location of raw data
 	
`p_dataset`	a character string naming the type of dataset ("train" or "test"). Attribute value is used to create the data file names and is attached to the "subject_", "y_" and "X_" prefixes of the raw data.

`p_activityLabels`	data frame containing the activity IDs with their corresponding labels


### Value

The function returns a data.frame object containing the combined data set of yData labelled with activityLabels and the measurement data (xData).


### Details

All attributes are mandatory.

Having two separate attributes (`p_obsDir, p_dataset`), the function enables the name of the data directory and the name of the dataset to be different. (Though, this is not the case in for the assignment data.)


### Note

The function can be called in "stand alone" mode, i.e. without using the `run_analysis()` master.

Warning: NO error handling is implemented! Be careful to set valid attributes!


### Examples

Source data is located in the work directory and its standard subdirectories:
`result <- read_observations
	("test","test",activityLabels)`

Source data is located at any other (non standard) locations:
`result <- read_observations
	("mydirectory","mydataset",myactivityLabels)`
	
	
	
	
