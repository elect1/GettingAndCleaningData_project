## Getting and Cleaning Data Course Project
## Script name: run_analysis.R

datadir <- "UCI_HARUS_data"  ## where to download the data

library( dplyr )  ## needed for rename(), mutate(), and select()

## -----------------------------------------------------------------

source( "download_HAR_data.R" )  ## download and unpack raw data
source( "read_HAR_activity.R" )  ## read in activity labels
source( "read_HAR_features.R" )  ## read in features information

source( "read_HAR_training_data.R" )  ## read training data
## the above defines the following data sets:
##     1. training_data (read from X_train.txt)
##     2. training_Labl (read from y_train.txt)
##     3. training_Subj (read from subject_train.txt)

source( "read_HAR_test_data.R" )  ## read test data
## the above defines the following data sets:
##     1. test_data (read from X_test.txt)
##     2. test_Labl (read from y_test.txt)
##     3. test_Subj (read from subject_test.txt)

## -------------------- assemble full data set ----------------------

print( "assembling full data set..." )

## column-bind the following:
## (1) subject IDs, (2) activity labels, (3) training or test descriptor,
## and add features data as columns 4 through 564

nDV <- 3  ## number of descriptor variables
ACT <- 2  ## column number corresponding to 'activity' training label

tmp <- cbind( training_Subj, training_Labl )  ## descriptor columns 1-2
tmp <- mutate( tmp, group="training" )        ## add descriptor column 3
training_data <- cbind( tmp, training_data )  ## augment training data with descriptors

tmp <- cbind( test_Subj, test_Labl )          ## descriptor columns 1-2 
tmp <- mutate( tmp, group="test" )            ## add descriptor column 3
test_data <- cbind( tmp, test_data )          ## augment test data with descriptors

## row-bind training and test data to obtain full data set:
full_data <- rbind( training_data, test_data )
## full_data is a data frame with 10299 observations of 564 variables
## The first 3 variables are 'subject', 'activity' and 'group'
## The remaining 561 variables are the features described in feature_data

rm( training_data, training_Subj, training_Labl,
    test_data, test_Subj, test_Labl, tmp )  ## clean up

## ------------------ create first tidy data set --------------------

print( "selecting mean() and std() subset..." )

## find column indices corresponding to mean() and std():
idx_mean <- grep( "mean\\(\\)", names(full_data) )
idx_std  <- grep(  "std\\(\\)", names(full_data) )

## extract the desired columns:
mean_std_data <- select( full_data, 
                         subject, activity, group,
                         idx_mean, idx_std )
## mean_std_data is a data frame with 10299 observations of 69 variables
## The first 3 variables are 'subject', 'activity' and 'group'
## Variables  4-36 are the feature mean values, and 
## Variables 37-69 are the feature standard deviation values

rm( full_data )  ## clean up

source( "clean_up_HAR_names.R" )  ## use descriptive activity names 

## write tidy summary to file

tidyfile1 <- paste( datadir, "/First_tidy_file.csv", sep="" )
write.csv( mean_std_data, file=tidyfile1, row.names=FALSE )

## ------------ form second (summary) tidy data set -----------------

print( "data split and averaging..." )

## From the mean_std_data data set, create a second, independent 
## tidy data set with the average of each variable for each activity
## and each subject

featseq <- (nDV+1):ncol(mean_std_data)  ## features sequence (based on columns)

## split mean_std_data data set based on subject ID:
subject_list <- split( mean_std_data, mean_std_data$subject )

## initialize empty summary matrix:
x <- matrix( nrow=0, ncol=ncol(mean_std_data) )

for ( i in 1:length(subject_list) ) {
    ## split current subject block based on 'activity' (ACT column):
    subject_activity_list <- split( data.frame(subject_list[i]), 
                                    data.frame(subject_list[i])[,ACT] )
    ## for each activity, perform column averaging of features:
    for ( k in 1:length(subject_activity_list) ) {
        datablock <- data.frame( subject_activity_list[k] )
        colnames( datablock ) <- colnames( mean_std_data )  ## necessary for rbind
        result <- colMeans( datablock[,featseq] )  ## col avg of features
        result <- matrix( result, nrow=1 )         ## necessary for cbind
        result <- cbind( datablock[1,1:nDV], data.frame(result) )
        x <- rbind( x, result )  ## append result to x summary
    }  ## end loop on activities
}  ## end loop on subjects

colnames(x) <- colnames(mean_std_data)  ## restore original column names

## write tidy summary to file (*.csv and *.txt formats)

tidyfile2 <- paste( datadir, "/Second_tidy_file_Summary.csv", sep="" )
write.csv( x, file=tidyfile2, row.names=FALSE )

tidyfile3 <- paste( datadir, "/Second_tidy_file_Summary.txt", sep="" )
write.table( x, file=tidyfile3, row.names=FALSE )

## write codebook
source( "write_HAR_analysis_Codebook.R")
