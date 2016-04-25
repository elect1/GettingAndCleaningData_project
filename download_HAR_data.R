    
    ## -------------------- get raw data --------------------------
    ## Get UCI data on Human Activity Recognition Using Smartphones
    
    ## License:
    ## ========
    ## Use of this dataset in publications must be acknowledged by 
    ## referencing the following publication [1] 
    ## [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
    ##     Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones
    ##     using a Multiclass Hardware-Friendly Support Vector Machine. 
    ##     International Workshop of Ambient Assisted Living (IWAAL 2012)
    ##     Vitoria-Gasteiz, Spain. Dec 2012
    
    if ( !file.exists(datadir) ) { dir.create(datadir) }
    
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile <- paste( "./", datadir,
                      "/getdata-projectfiles-UCI HAR Dataset.zip", sep="" )
    datefile <- paste( "./", datadir, "/UCI HAR Dataset_date.csv", sep="" )
    
    ## Download zip data and record download date:
    if ( !file.exists(zipfile) ) {
        print("downloading data...")
        download.file( fileURL, zipfile, mode="wb" )
        dateDownloaded <- date()
        write.csv( data.frame(dateDownloaded),
                   file=datefile, row.names=FALSE )  ## save download date
    } else { ## file already exists => just restore previous download date
        dateDownloaded <- as.character( 
            read.csv(file=datefile)$dateDownloaded[1] )
    }
    
    ## Unzip data:
    library( utils )
    extract_dir <- paste( "./", datadir, sep="" )
    unzipped_datadir <- paste( extract_dir, "/UCI HAR DataSet", sep="" )
    if ( !file.exists( unzipped_datadir ) ) {
        print( "unzipping data..." )
        unzip( zipfile, exdir=extract_dir )
    }
    
