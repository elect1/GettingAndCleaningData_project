## write HAR analysis code book

print( "writing Codebook..." )

Codebook <- paste( datadir, "/HAR_analysis_Codebook.md", sep="" )
fileConn <- file( Codebook )

file1 <- sub( paste( datadir,"/",sep="" ), "", tidyfile1 )
file2 <- sub( paste( datadir,"/",sep="" ), "", tidyfile2 )

mdtext <- ""

string <- c( "# HAR Analysis Codebook", "" )
mdtext <- paste( mdtext, string, sep="" )

string <- "The following describes the column names"
string <- paste( string, "of the data set contained in file")
string <- paste( string, " **",file1,"**, as well as the", sep="" )
string <- paste( string, "companion summary data set contained in file" )
string <- paste( string, " **",file2,"**.", sep="" )
string <- paste( string, "Both of these files were generated")
string <- paste( string, "from scratch by running the R script")
string <- paste( string, "*run_analysis.R*.")
string <- c( string, "" )
mdtext <- c( mdtext, string )

string <- c( "#### Variables ####", "" )
mdtext <- c( mdtext, string )

string <- "The first 3 variables are descriptor variables, including"
string <- c( string, "" )
mdtext <- c( mdtext, string )

string <- paste( "- the subject ID number (1-",
                    length(subject_list),")",sep="" )
mdtext <- c( mdtext, string )
string <- paste( "- the activity label ('",activity_data[1,2],
                    "'', etc.)", sep="" )
mdtext <- c( mdtext, string )
string <- paste( "- the subject group ('training' or 'test')", sep="" )
string <- c( string, "" )
mdtext <- c( mdtext, string )

string <- "The remaining variables are means and standard"
string <- paste( string, "deviations of measured features.")
string <- paste( string, "For time-domain measurements" )
string <- paste( string, " (variables starting with *time*),", sep="")
string <- paste( string, "the units of acceleration are in standard gravity")
string <- paste( string, "units (g's), while gyro output measurements")
string <- paste( string, "are in radians/seconds.  Variable names")
string <- paste( string, " starting with *frequency* refer to the corresponding", sep="" )
string <- paste( string, "frequency-domain measurements.")
string <- c( string, "" )
mdtext <- c( mdtext, string )

for ( k in 1:ncol(mean_std_data) ) {
    string <- ""
    string <- paste( string, "Column ", k, ": ", sep="" )
    string <- paste( string, " *", names(mean_std_data)[k], "*", sep="" )
    mdtext <- c( mdtext, string )
}

string <- c( "", "#### Summary ####", "" )
mdtext <- c( mdtext, string )

string <- paste( "The summary file **", file2, "**", sep="" )
string <- paste( string, "displays the mean values of each of the" )
string <- paste( string, "measured (feature) variables when" )
string <- paste( string, "*split* per subject and per activity.")
string <- c( string, "" )
mdtext <- c( mdtext, string )

writeLines( mdtext, fileConn )

close(fileConn)
