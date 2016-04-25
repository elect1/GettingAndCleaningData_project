# HAR Analysis Codebook

The following describes the column names of the data set contained in file **First_tidy_file.csv**, as well as the companion summary data set contained in file **Second_tidy_file_Summary.csv**. Both of these files were generated from scratch by running the R script *run_analysis.R*.

#### Variables ####

The first 3 variables are descriptor variables, including

- the subject ID number (1-30)
- the activity label ('WALKING'', etc.)
- the subject group ('training' or 'test')

The remaining variables are means and standard deviations of measured features. For time-domain measurements (variables starting with *time*), the units of acceleration are in standard gravity units (g's), while gyro output measurements are in radians/seconds.  Variable names starting with *frequency* refer to the corresponding frequency-domain measurements.

Column 1:  *subject*
Column 2:  *activity*
Column 3:  *group*
Column 4:  *timeBodyAccelerationMeanXcomponent*
Column 5:  *timeBodyAccelerationMeanYcomponent*
Column 6:  *timeBodyAccelerationMeanZcomponent*
Column 7:  *timeGravityAccelerationMeanXcomponent*
Column 8:  *timeGravityAccelerationMeanYcomponent*
Column 9:  *timeGravityAccelerationMeanZcomponent*
Column 10:  *timeBodyAccelerationJerkMeanXcomponent*
Column 11:  *timeBodyAccelerationJerkMeanYcomponent*
Column 12:  *timeBodyAccelerationJerkMeanZcomponent*
Column 13:  *timeBodyGyroMeanXcomponent*
Column 14:  *timeBodyGyroMeanYcomponent*
Column 15:  *timeBodyGyroMeanZcomponent*
Column 16:  *timeBodyGyroJerkMeanXcomponent*
Column 17:  *timeBodyGyroJerkMeanYcomponent*
Column 18:  *timeBodyGyroJerkMeanZcomponent*
Column 19:  *timeBodyAccelerationMagnitudeMean*
Column 20:  *timeGravityAccelerationMagnitudeMean*
Column 21:  *timeBodyAccelerationJerkMagnitudeMean*
Column 22:  *timeBodyGyroMagnitudeMean*
Column 23:  *timeBodyGyroJerkMagnitudeMean*
Column 24:  *frequencyBodyAccelerationMeanXcomponent*
Column 25:  *frequencyBodyAccelerationMeanYcomponent*
Column 26:  *frequencyBodyAccelerationMeanZcomponent*
Column 27:  *frequencyBodyAccelerationJerkMeanXcomponent*
Column 28:  *frequencyBodyAccelerationJerkMeanYcomponent*
Column 29:  *frequencyBodyAccelerationJerkMeanZcomponent*
Column 30:  *frequencyBodyGyroMeanXcomponent*
Column 31:  *frequencyBodyGyroMeanYcomponent*
Column 32:  *frequencyBodyGyroMeanZcomponent*
Column 33:  *frequencyBodyAccelerationMagnitudeMean*
Column 34:  *frequencyBodyBodyAccelerationJerkMagnitudeMean*
Column 35:  *frequencyBodyBodyGyroMagnitudeMean*
Column 36:  *frequencyBodyBodyGyroJerkMagnitudeMean*
Column 37:  *timeBodyAccelerationStandardDeviationXcomponent*
Column 38:  *timeBodyAccelerationStandardDeviationYcomponent*
Column 39:  *timeBodyAccelerationStandardDeviationZcomponent*
Column 40:  *timeGravityAccelerationStandardDeviationXcomponent*
Column 41:  *timeGravityAccelerationStandardDeviationYcomponent*
Column 42:  *timeGravityAccelerationStandardDeviationZcomponent*
Column 43:  *timeBodyAccelerationJerkStandardDeviationXcomponent*
Column 44:  *timeBodyAccelerationJerkStandardDeviationYcomponent*
Column 45:  *timeBodyAccelerationJerkStandardDeviationZcomponent*
Column 46:  *timeBodyGyroStandardDeviationXcomponent*
Column 47:  *timeBodyGyroStandardDeviationYcomponent*
Column 48:  *timeBodyGyroStandardDeviationZcomponent*
Column 49:  *timeBodyGyroJerkStandardDeviationXcomponent*
Column 50:  *timeBodyGyroJerkStandardDeviationYcomponent*
Column 51:  *timeBodyGyroJerkStandardDeviationZcomponent*
Column 52:  *timeBodyAccelerationMagnitudeStandardDeviation*
Column 53:  *timeGravityAccelerationMagnitudeStandardDeviation*
Column 54:  *timeBodyAccelerationJerkMagnitudeStandardDeviation*
Column 55:  *timeBodyGyroMagnitudeStandardDeviation*
Column 56:  *timeBodyGyroJerkMagnitudeStandardDeviation*
Column 57:  *frequencyBodyAccelerationStandardDeviationXcomponent*
Column 58:  *frequencyBodyAccelerationStandardDeviationYcomponent*
Column 59:  *frequencyBodyAccelerationStandardDeviationZcomponent*
Column 60:  *frequencyBodyAccelerationJerkStandardDeviationXcomponent*
Column 61:  *frequencyBodyAccelerationJerkStandardDeviationYcomponent*
Column 62:  *frequencyBodyAccelerationJerkStandardDeviationZcomponent*
Column 63:  *frequencyBodyGyroStandardDeviationXcomponent*
Column 64:  *frequencyBodyGyroStandardDeviationYcomponent*
Column 65:  *frequencyBodyGyroStandardDeviationZcomponent*
Column 66:  *frequencyBodyAccelerationMagnitudeStandardDeviation*
Column 67:  *frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation*
Column 68:  *frequencyBodyBodyGyroMagnitudeStandardDeviation*
Column 69:  *frequencyBodyBodyGyroJerkMagnitudeStandardDeviation*

#### Summary ####

The summary file **Second_tidy_file_Summary.csv** displays the mean values of each of the measured (feature) variables when *split* per subject and per activity.

