
setwd("C:/Users/Dat Nguyen/Data-Science/Getting & Cleaning Data/Course Project")

# 1. Merges the training and the test sets to create one data set.
# Read X_train.txt and X_test.txt file
df1 <- read.table("train/X_train.txt")
df2 <- read.table("test/X_test.txt")
# Merge X_train.txt and X_test.txt 
X_total <- rbind(df1, df2)

# Read Y_train.txt and Y_test.txt file
df1 <- read.table("train/y_train.txt")
df2 <- read.table("test/y_test.txt")
# Merge Y_train.txt and Y_test.txt 
Y_total <- rbind(df1, df2)

# Read subject_train.txt and subject_test.txt file
df1 <- read.table("train/subject_train.txt")
df2 <- read.table("test/subject_test.txt")
# Merge subject_train.txt and subject_test.txt 
Sub_total <- rbind(df1, df2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Read in the feature names from the features.txt file
features <- read.table("features.txt")

# Show standard_features which have mean and standard deviation measures.
standard_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

# show the names of features which have mean and standard deviation measures.
X <- X_total[, standard_features]
names(X) <- features[standard_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

# 3. Uses descriptive activity names to name the activities in the data set.
# Read in the activities from the activity_labels.txt file
activities <- read.table("activity_labels.txt")

# Replace "_" in activity_labels
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))

# descriptive activity names to name the activities in the data set
Y_total[,1] = activities[Y_total[,1], 2]

# 4. Appropriately labels the data set with descriptive activity names.
# names of data set
names(Y_total) <- "activity"
names(Sub_total) <- "subject"

# merge tidy data
cleaned <- cbind(Sub_total, Y_total, X)

# write clean data to a text file with the name "clean_final_data"
write.table(cleaned, "clean_final_data.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# using the {reshape2}
library(reshape2)

# create the molten data set
molten <- melt(cleaned,id.vars=c("subject","activity"))

# cast the molten data set into a collapsed tidy dataset
tidy <- dcast(molten,subject + activity ~ variable,mean)

# write the dataset to a text file
write.table(tidy, "dataset2.txt")