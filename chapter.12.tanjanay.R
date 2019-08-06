##Chapter 12 Notes##

datasets
#filled with example datasets provided by R
data()
#can see all the datasets that are available in the packages that you have loaded 
data(package = .packages(TRUE))
# For a more complete list, including data from all packages that have been installed
data("<name of dataset>", package = "<name of package>")
#access data in any of these datasets
read.table
#reads csv/tab delimited files and stores the results in a data frame
#can accept a url
HEADER = TRUE
#use this arg if the data has a header row
#use FALSE if the data does not have a header row
fill = TRUE
#makes read.table substitute NA values for the missing fields if all of the lines are not complete
system.file
#used to locate files that are inside a package 
sep
#determines the character to use as a separator between fields
#example: "\t" for tabs or spaces
nrow
#specify how many lines of data to read
skip
#how many lines at THE START of the file you want to skip
read.csv
#sets the default separator to a comma, and assumes that the data has a header row
read.csv2
#uses a comma for decimal places and a semicolon as a separator.
read.delim/read.delim2
#import tab-delimited files with periods or commas for decimal places
scan
#useful for malformed or nonstandard files
#otherwise, do not use it
write.table & write.csv
#Both functions take a data frame and a file path to write to
readLines
#accepts a path to a file (or a file connection) and, optionally, a maximum number of lines to read
writeLines
#takes a character vector and a file to write to
install.packages("XML")
#allows you to read XML files
#XML files are widely used for storing nested data
xmlParse
#importing xml data
useInternalNodes = FALSE 
xmlTreeParse
#to use R-level nodes
xpathSApply(r_options, "//variable[contains(@name, 'warn')]")
#lets you find nodes that correspond to some filter. 
#In this^ example we look anywhere in the document (//) fora node named variable where ([]) the
#name attribute (@) contains the string "warn".
htmlParse
htmlTreeParse
#import html data
#behave the same way as xmlParse and xmlTreeParse, but for html files
library(Runiversal)
ops <- as.list(options())
cat(makexml(ops), file = "options.xml")
#useful for serializing (a.k.a. “saving”) objects in a format that can be read by most other pieces of software.
read.xlsx
read.xlsx2
#import excel spreadsheets
#2nd one^ is better option because its faster
colClasses
#argument determines what class each column should have in the resulting data frame.
RExcel
excel.link
#uses COM connections to control Excel from R
gnumeric
#a package that provides functions for reading Gnumeric spreadsheets
write.xlsx2
#It work s the same way as write.csv, taking a data frame and a filename.   
download.file
#if the url is accessing a large file, just use this function 
#to create a local copy, and then import that
htmlParse
#use to parse the html page


#To connect to an SQLite database, you must first install and load the DBI package and the backend package RSQLite:
library(DBI)library(RSQLite)
#Then you define the database driver to be of type “SQLite” and set up a connection tothe database, in this case by naming the file:
driver <- dbDriver("SQLite")
db_file <- system.file( "extdata", "crabtag.sqlite", package = "learningr")
conn <- dbConnect(driver, db_file)

dbGetQuery
#retrieve data from the databases you write a query, which is just a string containing SQL commands, and 
#send it to the database
on.exit
# to make sure that the cleanup code always runs.
# runs R code whenever its parent function exits, whether it finishes correctly or throws an error
dbReadTable
#reads a table from the connected database
dbListTables(conn)
#lists the tables in a database
#if you can’t remember the name of the table that you want, use this function to see
RODBC
# this package is an alternative that uses ODBC database connections
# useful for connecting to SQLServer or Access databases.

odbcConnect
#to connect to ODBC data source
sqlQuery
#to run a query
odbcClose
#to clean up afterward:
#here's an example
library(RODBC)
conn <- odbcConnect("my data source name")
id_block <- sqlQuery(conn, "SELECT * FROM IdBlock")
odbcClose(conn)


RJSONIO
rjson
yaml
# all packages that read JSON/YAML
foreign
# a package that reads data from other statistics software
#-------------------------------------------------------------------------------------------------------------------

##Quiz##
# Question 12-1
# How do you find all the datasets built into R and the packages on your machine?
# dataset or data

# Question 12-2
# What is the difference between the read.csv and read.csv2
# functions?
# read.csv sets the default separator to a comma and periods for decimal places, meanwhile
# read.csv2 uses a comma for decimal places and a semicolon as a separator

# Question 12-3
# How would you import data from an Excel spreadsheet into R?
# read.xlsx2 as a first choice, then read.xlsx second

# Question 12-4
# How would you import data from a CSV file found on the Internet?
# use read.csv or download.file to get a local copy

# Question 12-5
# The DBI package provides a consistent interface to several database management systems. Which ones are supported?
# SQLite, MySQL, PostgreSQL, and Oracle databases

#-------------------------------------------------------------------------------------------------------------------

##Exercises##

# Exercise 12-1
# In the extdata folder of the learningr package, there is a file named hafu.csv, containing data on mixed-race manga characters. 
# Import the data into a data frame.[5]
hafuFile <- system.file("extdata", "hafu.csv", package = "learningr")
hafuData <-  read.csv(hafufile)

# Exercise 12-2
# Also in the extdata folder of learningr is an Excel file named multi-drug-resistant gonorrhoea infection.xls.
# Import the data from the first (and only) sheet into a dataframe. 
# Hint: this is a little easier if you view the file in a spreadsheet program first. LibreOffice is free and accomplishes this task easily. [10]

#it is in xls format, so library(xlsx) is needed
install.packages('xlsx') #or
install.packages('devtools') 
devtools::install_github('dragua/xlsx')
library(xlsx)
library(Runiversal) #maybe this...?
#okay so I read through the error, turns out Java 1.6 and greater is necessary. This isnt avaible on ISB laptops
#i still finished the rest of the code, however I cannot run/view it without the package installed
gonorrhoeaFile <- system.file("extdata", "multi-drug-resistant gonorrhoea infection.xls", package = "learningr")
gonorrhoeaData <- read.xlsx2( gonorrhoeaFile, sheetIndex = 1)
head(gonorrhoeaData)

# Exercise 12-3
# From the crab tag SQLite database described in this chapter, import the contents of the Daylog table into a data frame. [10]

library(RSQLite)
driver <- dbDriver("SQLite")
databaseFile <- system.file("extdata", "crabtag.sqlite", package = "learningr")
connection <- dbConnect(driver, databaseFile)


