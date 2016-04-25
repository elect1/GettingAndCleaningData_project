## Read in HAR data activity labels information

activity_file <- paste( unzipped_datadir, "/activity_labels.txt", sep="" )
activity_data <- read.table( activity_file )
