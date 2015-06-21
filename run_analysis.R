library(dplyr)

#### Part 1 - Load and merge training and test data set into a single data set ####

# Load column names for train_x and test_x into data frame
features <- read.table("features.txt")

# Load train datasets into data frames - sets the column names here instead of in part 4
train_x <- read.table("train//X_train.txt", col.names = features$V2)
train_y <- read.table("train//Y_train.txt", col.names = c("Activity"))
train_s <- read.table("train//subject_train.txt", col.names = c("Subject"))

# Join train datasets
train <- cbind(train_x, train_s, train_y)

# Dispose of data frames that are no longer needed
rm("train_x")
rm("train_y")
rm("train_s")

# Load test datasets into data frames - sets the column names here instead of in part 4
test_x <- read.table("test//X_test.txt", col.names = features$V2)
test_y <- read.table("test//Y_test.txt", col.names = c("Activity"))
test_s <- read.table("test//subject_test.txt", col.names = c("Subject"))

# Join test datasets
test <- cbind(test_x, test_s, test_y)

# Dispose of data frames that are no longer needed
rm("test_x")
rm("test_y")
rm("test_s")

# Merge train and test data into new data frame
dataset <- rbind(train, test)

# Dispose of data frames that are no longer needed
rm("train")
rm("test")
rm("features")

# Remove periods from column names
names(dataset) <- gsub("\\.", "", names(dataset))

#### Part 2 - Extract only mean and standard deviation columns ####
# Use a regular expression in grep to find column name matches
# Only matches "mean" or "std" with an optional X, Y or Z at the end of the column name
# Also includes the Subject and Activity columns
dataset <- select(dataset, grep(".*mean[XYZ]?$|.*std[XYZ]?$|Activity|Subject", colnames(dataset)))

#### Part 3 - Replace activity codes with activity labels ####
# Load activity labels into data frame
activities <- read.table("activity_labels.txt")

# Join dataset and activities data frames
dataset <- merge(dataset, activities, by.x="Activity", by.y="V1")

# Replace activity codes with activity labels and drop the extra column
dataset$Activity <- dataset$V2
dataset <- subset(dataset, select = -V2)

# Dispose of data frames that are no longer needed
rm("activities")

#### Part 4 - Set appropriate column labels ####
# Already handled in Part 1

#### Part 5 - Create second data set with average of variables by Activity and Subject  ####
# Create new data frame grouped by Subject and Activity
dataset.tidy = group_by(dataset, Subject, Activity)

# Calculate mean for all variable type columns
dataset.tidy = summarise_each(dataset.tidy, funs(mean))

# Write out data frame to csv
write.table(dataset.tidy, file = "tidy.txt", row.name = FALSE)