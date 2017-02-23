#
#

# Read in X_test.txt in X_train.txt
# These are the observations (rows)for all the 561 variables
# test has 2947 observations(rows)
# tain has 7352 observations(rows)
test <- read.table("../Data/UCI HAR Dataset/test/X_test.txt", stringsAsFactors = F)
train <- read.table("../Data/UCI HAR Dataset/train/X_train.txt", stringsAsFactors = F)

# Read in y_test.txt and y_train.txt
# These are the labels for type of activity that the rows
# correspond to. E.g. 1 = Walking , 5 = Standing etc
# test_labels has 2947 observations(rows)
# tain_labels has 7352 observations(rows)
test_labels <- read.table("../Data/UCI HAR Dataset/test/y_test.txt", stringsAsFactors = F)
train_labels <- read.table("../Data/UCI HAR Dataset/train/y_train.txt", stringsAsFactors = F)


# Rename the columnn
colnames(test_labels) <- c("activity")
colnames(train_labels) <- c("activity")

# Add the activity column to the DataFrames test and train
test <- cbind(test, test_labels)
train <- cbind(train, train_labels)

# Read in the Subjects info. The subjects are identified by number
# test_subjects has 2947 observations(rows)
# tain_subjects has 7352 observations(rows)
test_subjects <- read.table("../Data/UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = F)
train_subjects <- read.table("../Data/UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = F)

# Rename the columnn
colnames(test_subjects) <- c("subject")
colnames(train_subjects) <- c("subject")

# Add the subject column to the DataFrames test and train
test <- cbind(test, test_subjects)
train <- cbind(train, train_subjects)


# Merge the DataFrames.
# mdata has (2947 + 7352 =) 10299 rows and 563 columns
# 561 orginal columns plus "acitivity" and "subject" columns that we added.
mdata <- merge(test,train, all = T)

# Read in features.txt
# These are the names of the 561 variables (Columns)
feat <- read.table("../Data/UCI HAR Dataset/features.txt", stringsAsFactors = F)

# Properly name mdata columns with these column names
# feat contains the original 561 column names, we add the column names for last 2.
colnames(mdata) <- c(feat[,2],"activity","subject")

# Extract only the columns with mean and std 
# this is a DF with 86 columns and 10299 rows
mdata2 <- mdata[grep("[Mm]ean|[Ss]td", names(mdata))]

# Extract activity and sub columns from mdata
act <- mdata[,562, drop = F]
sub <- mdata[,563, drop = F]

# Attach these 2 to mdata2
mdata2 <- cbind(mdata2, act)
mdata2 <- cbind(mdata2, sub)

# Label the acitvity column with descriptive names
good <- mdata2$activity == 1
mdata2[good,c("activity")] <- "walking"

good <- mdata2$activity == 2
mdata2[good,c("activity")] <- "walking_upstairs"

good <- mdata2$activity == 3
mdata2[good,c("activity")] <- "walking_downstairs"

good <- mdata2$activity == 4
mdata2[good,c("activity")] <- "sitting"

good <- mdata2$activity == 5
mdata2[good,c("activity")] <- "standing"

good <- mdata2$activity == 6
mdata2[good,c("activity")] <- "laying"

# Remove cpecial characters from column names
names2 <- gsub("-","",names(mdata2))
names2 <- gsub("\\(","",names2)
names2 <- gsub("\\)","",names2)
names2 <- gsub(",","",names2)

colnames(mdata2) <- names2

# Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
mdata3 <- mdata2 %>% group_by(activity, subject) %>% summarise_at(c(1:86), mean) 
