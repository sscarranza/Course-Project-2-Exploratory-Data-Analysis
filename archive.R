# Course Project 2: Exploratory Data Analysis
# SABRINA KATE S. CARRANZA | Archive

# Set Working Directory and see if the Directory "data" exists and if not then creates it

setwd("/Users/SKSC/Documents/CourseraExpDataAnalysis")
if (!file.exists("data")) {
  dir.create("data")
}

## Set URL Location and download the dataset

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "./Data/FNEI_data.zip", method = "curl")
list.files("./data")
datedownloaded <- date()
datedownloaded

## Unzip the file in the current working directory and will overwrite if exists
unzip(zipfile = "/Users/SKSC/Documents/Coursera/data/FNEI_data.zip",exdir = "/Users/SKSC/Documents/CourseraExpDataAnalysis/data/", overwrite = TRUE)
list.files("./data/")

