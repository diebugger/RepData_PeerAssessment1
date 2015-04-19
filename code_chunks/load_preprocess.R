### Load useful libraries
library("dplyr")
library("knitr")
library("lubridate")
library("ggplot2")

# prerequisite: normalize to US locale
Sys.setlocale(category = "LC_ALL", locale = "US")

### unzip and read table
unzip("activity.zip")
activity <- read.csv("activity.csv", header = T)
### convert date
activity$date <- as.Date.factor(activity$date)
activity <- tbl_df(activity)
### remove NAs
clean_activity <- activity[!is.na(activity$steps),]
