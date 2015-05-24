
#common function for resue in all plots

load_nei <- function() {
 data_url <-"https://d396qusza40orc.cloudfront.net/exdata/data/NEI_data.zip"
 zip_file <- "./NEI_data.zip"
 nei_file <- "./data/summarySCC_PM25.rds"


## if data file doesn't exist, download, and unzip, loadRDS
 if(! file.exists(nei_file)) {
  if(!file.exists("./data/")) {
    dir.create("./data/")
  }
  
  download.file(data_url, destfile=zip_file, method="curl")
  unzip(zip_file,exdir="./data")
 }
 readRDS(nei_file)
}