#Final Project for Getting and Cleaning Data Course 

#Step 0: import library to be able to use melt and cast functions:
library(reshape)

# Step 1: Set up and get data

#Unzip data file
unzip("~/Downloads/getdata_projectfiles_UCI HAR Dataset.zip")
#Change to test directory 
setwd("/Users/alinarainsford/Downloads/UCI HAR Dataset")
setwd("./test")
#Read test files 
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
#Change to train directory 
setwd("../")
setwd("./train")
#Read train files
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
#Read in other docs in directory 
setwd("/Users/alinarainsford/Downloads/UCI HAR Dataset")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#Step 2: Extract only mean and standard deviations from obs
mean_std <- grep( "mean\\(\\)|std", features[,2])

#Step 3: Merge test and train data sets 
mergedX <- rbind(X_test, X_train)
meanSTD_x <- mergedX[,mean_std]
merged_y <- rbind(y_test, y_train)
merged_subject <- rbind(subject_test, subject_train)

#Step 4: Standardize names for the mean, std, rows and columns
standardized <-features[mean_std,2]
MeanStdNames<-tolower(standardized)
MeanStdNames <-gsub("[()]","", MeanStdNames)
meanstdnames<-gsub("[-]","",MeanStdNames)
names(meanSTD_x)<-MeanStdNames
names(meanSTD_x) <- tolower(names(meanSTD_x))
names(merged_subject) <- "Subject"
names(merged_y) <- "active"
names(activity_labels)<-c("number","activity")
activity_labels$activity<-tolower(activity_labels$activity)
activity_labels$activity<-gsub("[_]","",activity_labels$activity)

#Step 5: Create new tidy data set and write to text file
tidied <- cbind(meanSTD_x, merged_subject, merged_y)
tidied <- merge(tidied,activity_labels,by.x="active",by.y="number",sort=FALSE)
tidied <- na.omit(tidied)
tidied$active <- NULL
tidiedmelt <- melt(tidied, id=c("Subject","activity"))
tidiedmeltcast <- cast(tidiedmelt, Subject + activity~variable,mean)
write.table(tidiedmeltcast,file="tidySet.txt",row.names=FALSE)

