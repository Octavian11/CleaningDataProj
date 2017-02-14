
### Original Data Set

### Actions performed on the Original Data
#### 1. Read in the data provided in X_test.txt
 1. Read in the data provided in the file names X_test.txt in a data frame called test. This is a data frame with 561 columns and 2947 observations.
 2. Read in the data provided in the file names X_train.txt in a data frame called train. This is a data frame with 561 columns and 7352 observations.

***NOTE*** The names of these 561 variables are provided in the "features.txt", and the description of some these variables is in the "README.txt",
both files are proivded with the original Data set. For now these 561 columns are names V1, V2,V3....V561

#### 2. Merge the test and train dataframes
Merge the test and train dataframes by all columns to produce a dataframe with 561 columns and (2947 + 7352) = 10299 rows.

### 3. Extract the mean and std columns
Extract only the mean and std deviation columns for each measurement e.g. the mean column for measure "tBodyAcc" is called "tBodyAcc-mean()-X".
Close inspection of "features.txt " revleals that this the first column - V1 - in our dataframe. Similarly, the position of the cloumns containing means and standard deviation can be determined by looking at "features. txt"
