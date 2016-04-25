## Read in the unzipped Fixed Width individual files
## corresponding to test data sets and name columns
## based on feature_data

print( "reading in test data..." )

test_file <- paste( unzipped_datadir, "/test/X_test.txt", sep="" )
testLbl_file <- paste( unzipped_datadir, "/test/y_test.txt", sep="" )
testSbj_file <- paste( unzipped_datadir, "/test/subject_test.txt", sep="" )

test_data <- read.table( test_file )
test_Labl <- read.table( testLbl_file )
test_Subj <- read.table( testSbj_file )

## rename columns

colnames( test_data  ) <- feature_data[,2]
test_Subj  <- rename( test_Subj , subject=V1  )
test_Labl  <- rename( test_Labl , activity=V1 )
