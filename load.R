loaddata <- function(project_folder = ".") {

  ##
  # setfolder is used to setup project directory in current dir (".")
  ##
  setfolder <- function() {
    if (!file.exists(project_folder)) {
      dir.create(project_folder);
    }
    setwd(project_folder);
    if (file.exists("src")) {
      unlink("src", TRUE, TRUE);
    }
    dir.create("src");
    if (file.exists("data")) {
      unlink("data", TRUE, TRUE);
    }
    dir.create("data");
  }
  
  ##
  # getdata downloads and unzips data in current working dir
  #   src folder will contasin data.zip downloaded file
  #   data folder will contain unziped data
  ##
  getdatafile <- function() {
    url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
    download.file(url, "src/data.zip");
    unzip("src/data.zip", exdir = "data");
    return(list.files("data", recursive=FALSE)[1]);
  }
  
  ##
  # Function is used to laof and filter required data.
  # Only data from the dates 2007-02-01 and 2007-02-02 are loaded
  ##
  loaddata <- function(file) {
    data <- read.csv(paste("data", file, sep= "/"), sep = ";", na.strings="?")
    data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
  }
  
  setfolder()
  file <- getdatafile()
  return(loaddata(file))
}