#chapter 12 Notes

#Built-in package is called "datasets" and has example datasets like mtcars
data(package = .packages(TRUE)) #list of all datasets and their descriptions
data("kidney", package = "survival") #to access the data in a specific package that isn't database 
#if it's in the database package that means it's built in, so you just type the name you want
presidents
HairEyeColor 
UCBAdmissions

#head() function allows you to only look at a little bit of the data frame instead of the whole thing
head(mtcars)

read.table(mtcars,)
#The data has a header row, so we need to pass the argument header = TRUE to read.table
#The read.table function reads these delimited files and stores the results in a data frame.
#Passing the argument fill = TRUE makes read.table substitute NA values for the missing fields.

#read.csv is similar to read.table except it assumes header=TRUE (data has a header row) and a default separator with a comma
#stored in a CSV file
#use the skip and nrow arguments of read.csv to specify which bits of the file to read

#write.table and write.csv. take a data frame and a file path to write to

# Datasets supplied with R or packages can be made available with the data function.
# You can import data into R from a very wide range of external sources.
# read.table and its variants read rectangular data.
# readLines reads text files with nonstandard structures.
# You can read HTML and XML data with the XML package.
# There are lots of packages for reading Excel files, including xlsx.
# The foreign package reads data from other statistics software.
# There are lots of packages for manipulating databases, including DBI and RODBC.

# QUIZ: 
#   Question 12-1
# How do you find all the datasets built into R and the packages on your machine? 
data(package = .packages(TRUE))
data() #same thing 

#   Question 12-2
# What is the difference between the read.csv and read.csv2 functions? 
#read.csv uses periods and commas to separate items while read.csv2 uses commas and semicolons to separate items

#   Question 12-3
# How would you import data from an Excel spreadsheet into R? read.xlsx()

#   Question 12-4
# How would you import data from a CSV file found on the Internet? give the URL to read.csv(), or use download.file to get a local copy



#EXERCISES: 
# Exercise 12-1
# In the extdata folder of the learningr package, there is a file named hafu.csv, con‐
# taining data on mixed-race manga characters. Import the data into a data frame.
hafu_file <- system.file("extdata", "hafu.csv", package = "learningr")
hafu_data <- read.csv(hafu_file)

# Exercise 12-2
# Also in the extdata folder of learningr is an Excel file named multi-drug-resistant
# gonorrhoea infection.xls. Import the data from the first (and only) sheet into a data
# frame. Hint: this is a little easier if you view the file in a spreadsheet program first.
# LibreOffice is free and accomplishes this task easily. 
library(xlsx)
gonorrhoea_file <- system.file(
  "extdata",
  "multi-drug-resistant gonorrhoea infection.xls",
  package = "learningr"
)
gonorrhoea_data <- read.xlsx2(
  gonorrhoea_file,
  sheetIndex = 1,
  colClasses = c("integer", "character", "character", "numeric")
