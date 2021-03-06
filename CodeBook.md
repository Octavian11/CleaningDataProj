
### Original Data Set
The original dataset was obtained from [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This dataset contain several files that include important information about the raw data and each file included within.
### Actions performed on the Original Data
### 1. Read in the data provided 
 1. Read in the data provided in the file names X_test.txt in a data frame called test. This is a data frame with 561 columns and 2947 observations.
 2. Read in the data provided in the file names X_train.txt in a data frame called train. This is a data frame with 561 columns and 7352 observations.

***NOTE*** The names of these 561 variables are provided in the "features.txt", and the description of some these variables is in the "README.txt",
both files are proivded with the original Data set. For now these 561 columns are names V1, V2,V3....V561

### 2. Read in the activity data
 1. Read in the data provided in the file names y_test.txt in a data frame. This is a data frame that contains activity labels for every observation in X_test.
 2. Read in the data provided in the file names y_train.txt in a data frame. This is a data frame that contains activity labels for every observation in y_test.
 
 These labels are in the form of integers 1-6.

***NOTE*** Now every observation is labeled with the kind of activity that it corresponds i.e. whether this observation was taken Walking or Standing or Laying and so forth.

### 3. Add the activity column to the DataFrames test and train

### 4. Read in the subject data
 1. Read in the data provided in the file names subject_test.txt in a data frame. This is a data frame that contains subjects labels for every observation in X_test.
 2. Read in the data provided in the file names subject_train.txt in a data frame that contains subject labels for every observation in X_test.

***NOTE*** Now every observation is labeled with the identifier for each person (subject).

### 5. Add the subject column to the DataFrames test and train

### 6. Merge the test and train dataframes
Merge the test and train dataframes by all columns to produce a dataframe with 563 columns, 561 orginal columns plus "acitivity" and "subject" columns that we added, and (2947 + 7352) = 10299 rows.

### 7. Extract the mean and std columns
Extract only the mean and std deviation columns for each measurement. This is done by using grep for any column name with [Mm]ean and [Ss]td in it's name.

We now have a DF with 86 columns and 10299 rows.

### 8. Add acivity and subject column
Since these 2 columns were left as a result of step 7, we need to add them back. Now we have a DF with 88 columns.

### 9. Label in the activity data
 Label the activity data with descriptive names instead of integers. This Key is provided in the original dataset in the file named "acivity_labels.txt"
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

### 10. Remove cpecial characters from column names
The original column names provided in the "features.txt" file contain several special characters such as "-" "," "()" etc. We remove these special characters for cleaner column names.

### 11. Creates a second, independent tidy data set
Finally, we create a second, independent tidy data set with the average of each variable for each activity and each subject.
