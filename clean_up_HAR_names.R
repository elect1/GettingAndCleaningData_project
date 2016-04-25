## Clean up variable names using descriptive activity names 
## based on activity_data to name the activities in the data set:

print( "cleaning up names..." )

mean_std_data <- mutate( mean_std_data, 
                         activity=activity_data[activity,2] )

## Appropriately label the data set with descriptive variable names
## Do this by making more explicity and cleaning up abbreviations

tmp_names <- names( mean_std_data )
tmp_names <- sub( "^t", "time", tmp_names)
tmp_names <- sub( "^f", "frequency", tmp_names)
tmp_names <- sub( "Acc", "Acceleration", tmp_names)
tmp_names <- sub( "Mag", "Magnitude", tmp_names)
tmp_names <- sub( "-mean\\(\\)", "Mean", tmp_names)
tmp_names <- sub( "-std\\(\\)", "StandardDeviation", tmp_names)
tmp_names <- sub( "-X", "Xcomponent", tmp_names)
tmp_names <- sub( "-Y", "Ycomponent", tmp_names)
tmp_names <- sub( "-Z", "Zcomponent", tmp_names)

colnames( mean_std_data ) <- tmp_names  ## rename variables
