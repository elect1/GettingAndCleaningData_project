## Getting and Cleaning Data Course Project##

This analysis provides a tidy data summary of the Human Activity Recognition (HAR) Using Smartphones Dataset
Version 1.0  (Anguita D., et al. *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine*, International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012).

#### Synopsis ####
The R language analysis script **run_analysis.R** reads in zipped raw data and produces two tidy data sets in the following comma separated value files:
- *First_tidy_file.csv*, and
- *Second_tidy_file_Summary.csv*

The codebook describing the variables for these files is included here as the following file:
- *HAR_analysis_Codebook.md*

#### Analysis ####
The **run_analysis.R** script performs the following:

##### Read in data #####
1. Downloads and unzips the raw data found at [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "raw data").  (This function is performed by the subscript **download_HAR_data.R**).
2. Reads in the activity labels (subscript **read_HAR_activity.R**).
3. Reads in features information (subscript **read_HAR_features.R**).
4. Reads in the contents of the *training* data files *X_train.txt*, *y_train.txt* and *subject_train.txt* (subscript **read_HAR_training_data.R**).
5. Reads in the contents of the *test* data files *X_test.txt*, *y_test.txt* and *subject_test.txt* (subscript **read_HAR_test_data.R**).

##### Assemble full data set #####

1. For both the *training* and *test* data, a column-binding is first performed using the following 3 descriptor variables: (1) subject IDs, (2) activity labels, and (3) ''training' or ''test' descriptor.
2. For both  the *training* and *test* data, column-binding is further used to add the entirety of the features data as columns 4 through 564.
3. These two data sets are then row-bound together, resulting in a data frame named *full_data *.

##### Extract mean and standard deviation for each measurement #####

1. A subset of *full_data* is created, by selecting only the feature variable names containing the string *mean()* or *std()* which are added to the 3 descriptor variables, forming a new reduced data set named *mean_std_data*.
2. The subscript **clean_up_HAR_names.R** is then used to (a) substitute descriptive activity names, and (b) make the feature variable names more explicit. 
3. Finally, the resulting data frame is written to comma separated value file **First_tidy_file.csv**.

##### Creates a second, independent tidy data set with the average of each variable for each activity and each subject #####

1. The *mean_std_data* data frame is first split based on subject ID.
2. For each subject ID, the data is then further split based on activity.
3. For each of the resulting data blocks, a column mean is performed on the feature variables, and the results are aggregated via row-binding in a new summary data set named *x*.
4. Finally, the new *x* data set is written to comma separated value file **Second_tidy_file_Summary.csv**.

##### Automated Codebook generation #####

The final step performed by the **run_analysis.R** script is to generate a Codebook in markdown format (file **HAR_analysis_Codebook.md**), using the variable names and column numbers of the *mean_std_data* data frame.

