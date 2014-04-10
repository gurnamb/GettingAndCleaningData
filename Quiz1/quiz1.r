## Question 1
##
## The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
##
## and load the data into R. The code book, describing the variable names is here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
##
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
f <- file.path(getwd(), "PUMSDataDict06.pdf")
download.file(url, f)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
##
## How many housing units in this survey were worth more than $1,000,000?
##
require(data.table)
dt <- data.table(read.csv(f))
setkey(dt, VAL)
dt[, .N, key(dt)]


## Question 2
##
## Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?
setkey(dt, FES)
dt[, .N, key(dt)]


## Question 3
## 
## Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
## 
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
## 
## dat
## 
## What is the value of:
## 
## sum(dat$Zip*dat$Ext,na.rm=T) 
## 
## (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
f <- file.path(getwd(), "DATA.gov_NGAP.xlsx")
download.file(url, f)
require(xlsx)
rows <- 18:23
cols <- 7:15
dat <- read.xlsx(f, colIndex=cols, rowIndex=rows)
sum(dat$Zip*dat$Ext,na.rm=T) 
