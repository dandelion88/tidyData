## -------------------------------------------------------------
## function: run_analysis()
## 	combines "train" and "test" datasets
## 	drops unwanted columns (keeping only "mean" and "std" variables
## 	creates tidy column names
## 	calculates mean values for all variables by Subject+Activity groups
## p_rootDir: directory containing the common data (like "UciHarDataset")
## p_trainDir: directory of train data
## p_testDir: directory of test data
## -------------------------------------------------------------

run_analysis <- function(p_rootDir=getwd(), p_trainDir="train", p_testDir="test") {

setwd(p_rootDir)

## load dplyr package
library(dplyr)

## get descriptive data
activityLabels <- read.table("activity_labels.txt",sep="")
features <- read.table("features.txt",sep="")

## get Train data
train_data <- read_observations (p_trainDir, "train", activityLabels)

## get Test data
test_data <- read_observations (p_testDir, "test", activityLabels)

## combine the two datasets
all_data <- rbind(train_data,test_data)

## Label all columns
##names (subjectData) <- "SubjectId"
##names (yDataLabelled) <- c("ActivityId","rownum","Activity")
##names (xData) <- as.character(features[,2])
names (all_data) <- c("SubjectId",c("ActivityId","rownum","Activity"),as.character(features[,2]))

## Drop unwanted columns
## keep "SubjectId","ActivityId","Activity", drop "rownum"
keyCols <- c(1,2,4) 
## keep mean() and stddev() for each measurement
## Note: meanFreq() excluded intentionally !
meanCols <- grep("mean\\(\\)",colnames(all_data),ignore.case=TRUE)
stdCols <- grep("std\\(\\)",colnames(all_data),ignore.case=TRUE)
subset_all_data <- all_data[,c(keyCols,meanCols,stdCols)]

## "Tidyfy" column names (i.e. feature labels)

## replace "mean" with "Mean"
names(subset_all_data) <- gsub("mean","Mean",names(subset_all_data))
## replace "mean" with "Mean"
names(subset_all_data) <- gsub("std","Std",names(subset_all_data))
## remove all "-" characters
names(subset_all_data) <- gsub("\\-","",names(subset_all_data))
## remove all "()" pairs
names(subset_all_data) <- gsub("\\()","",names(subset_all_data))

## calculate mean() for each variable
dpData<-tbl_df(subset_all_data)

result<-dpData %.%
group_by(SubjectId,Activity) %.%
summarise_each(funs(mean))
## %.% select(SubjectId,Activity,fBodyAccMagStd)

## return grouped data set
result

}


## -------------------------------------------------------------
## function: read_observations()
## 	reads and prepares observation data
## p_obsDir: name of data directory
## p_dataset: name of dataset (train/test)
## p_activityLabels: 
## -------------------------------------------------------------
read_observations <- function (p_obsDir,p_dataset,p_activityLabels) {

## backup initial wd
initDir <- getwd()

## set wd to dataset directory
setwd(p_obsDir)

## prepare datafile names
subjectfile <- paste0("subject_",p_dataset,".txt")
yfile 		<- paste0("y_",p_dataset,".txt")
xfile 		<- paste0("X_",p_dataset,".txt")

## read raw observation data
subjectData <- read.table(subjectfile,sep="")
yData 		<- read.table(yfile,sep="")
xData 		<- read.table(xfile,sep="")

## add row numbers to yDdata (to retain original order)
rownum<-c(1:nrow(yData))
yData<-cbind(rownum,yData)

## merge yData with activityLabels & restore original order
yDataLabelled <- arrange(merge(yData,p_activityLabels,by.x="V1",by.y="V1"),rownum)

## combine data frame segments
observationData <- cbind(subjectData,yDataLabelled,xData)

## restore initial wd
setwd(initDir)

## return raw data set with all columns
observationData

}

