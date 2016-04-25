## Read in HAR data features information
## Form feature_data for naming the variables of the training and test
## data sets.

feature_file <- paste( unzipped_datadir, "/features.txt", sep="" )
feature_data <- read.table( feature_file, stringsAsFactors=FALSE )

## Fix non-unique feature_data names:

## some of the feature names are repeated -- hardcoded fix:
fix_start <- c( 303, 382, 461 )  ## beginning of *bandsEnergy()*
n_bands <- 14                    ## number of energy bands

for ( j in 1:length(fix_start) ) {
    for ( k in 1:n_bands ) {
        ix <- fix_start[j] - 1 + k
        iy <- fix_start[j] - 1 + k + n_bands
        iz <- fix_start[j] - 1 + k + n_bands*2
        feature_data[ix,2] <- sub( "\\(\\)", "()-X", feature_data[ix,2] )
        feature_data[iy,2] <- sub( "\\(\\)", "()-Y", feature_data[iy,2] )
        feature_data[iz,2] <- sub( "\\(\\)", "()-Z", feature_data[iz,2] )
    }
}
