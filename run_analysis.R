## The following code creates a dataset containing all columns
## that fulfills the following requirements:
## 1. Merges the training and the test sets to create one data set.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 

#read column names
column_name <- read.table("features.txt")
column_name <- column_name[,2]

#read activity table
activity_table <- read.table("activity_labels.txt")

#read test files and assign column names
#create a new column containing data type
x_test <- read.table("test/X_test.txt",stringsAsFactors=FALSE)
x_test <- setNames(x_test, column_name)

y_test <- read.table("test/y_test.txt",stringsAsFactors=FALSE)
y_test <- setNames(y_test, "Activity")
match_idx <- match(y_test$Activity, activity_table$V1)
y_test$Activity <- activity_table$V2[match_idx]

subject_test <- read.table("test/subject_test.txt",stringsAsFactors=FALSE)
subject_test <- setNames(subject_test, "Subject")

final_test <- cbind(x_test, y_test, subject_test)
final_test$DataType <- rep("test", nrow(x_test))

#read training files and assign column names
#create a new column containing data type
x_train <- read.table("train/X_train.txt",stringsAsFactors=FALSE)
x_train <- setNames(x_train, column_name)

y_train <- read.table("train/y_train.txt",stringsAsFactors=FALSE)
y_train <- setNames(y_train, "Activity")
match_idx <- match(y_train$Activity, activity_table$V1)
y_train$Activity <- activity_table$V2[match_idx]

subject_train <- read.table("train/subject_train.txt",stringsAsFactors=FALSE)
subject_train <- setNames(subject_train, "Subject")

final_train <- cbind(x_train, y_train, subject_train)
final_train$DataType <- rep("train", nrow(x_train))

#assembling the final data frame
final_full <- rbind(final_test, final_train)

## The following code creates a subset of data containing only mean and std columns
## that fulfills the following requirements:
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
final_subset <- final_full[, grepl('mean|std', names(final_full))]
#rebind with activity, subject and datatype columns
final_subset$Activity <- final_full$Activity
final_subset$Subject <- final_full$Subject
final_subset$DataType <- final_full$DataType

## The following code creates a "tidy" dataset
## with the average of each variable by activity *and* by subject
final_avg <- aggregate(final_subset, list(final_subset$Activity, final_subset$Subject), mean)
final_avg <- final_avg[, !colnames(final_avg) %in% c('Activity','Subject','DataType')]
colnames(final_avg)[1] <- "Activity"
colnames(final_avg)[2] <- "Subject"

# write tidy data files: average by activity and subject
write.table(final_avg, "final_avg_by_activity_subject.txt",row.names=FALSE)