## Read in the unzipped Fixed Width individual files
## corresponding to training data sets and name columns
## based on feature_data

print( "reading in training data..." )

training_file <- paste( unzipped_datadir, "/train/X_train.txt", sep="" )
trainLbl_file <- paste( unzipped_datadir, "/train/y_train.txt", sep="" )
trainSbj_file <- paste( unzipped_datadir, "/train/subject_train.txt", sep="" )

training_data <- read.table( training_file )
training_Labl <- read.table( trainLbl_file )
training_Subj <- read.table( trainSbj_file )

## rename columns

colnames( training_data ) <- feature_data[,2]
training_Subj <- rename( training_Subj, subject=V1  )
training_Labl <- rename( training_Labl, activity=V1 )
