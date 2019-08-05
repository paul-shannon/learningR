##Chapter 10 Notes##
#finish this weekend

##Chapter 10##

package
#is acollection of R functions and datasets, and a
library 
#is a folder on your machine thatstores the files for a package.
character.only = TRUE
#programmatically pass the name of the package to library
#use if there's a lot of packages to load
require
#loads a package, butrather than throwing an error it returns TRUE or FALSE,
#depending upon whether or notthe package was successfully loaded
search
#see the packages already loaded
#The packages that come with the R install (base, stats, and nearly 30 others) are storedin the
library or require
#subdirectory of wherever you installed R.
#opens packages
installed.packages
#returns a data frame with information about all thepackages that R knows about on your machine.
#also installs packages
LibPath
#column that provides the file location of the packagetells you the library that contains the package. 
.libPaths
#can see a character vector of all the libraries that R knows about
setRepositories()
#To access additional repositories, type this function and select the repositories that you want.
available.packages
#You can see information about all the packages that are available inthe repositories that you have
internet2.dll or setInternet2
#access the Internet
install.packages("devtools")
#install a package directly from GitHub
install_github
# accepts the name of the GitHub repository that containsthe package (usually the same as the name of the package itself) and 
# the name of the user that maintains that repository.
update.packages(ask = FALSE)
#updates packages
#ask = false helps with updating hundreds of packages since the function usually prompts you before each one
remove.packages
#removes packages

#--------------------------------------------------------------------------------------------------------------------------------------

##Quiz##

# Question 10-1
# What are the names of some R package repositories?
# 
# Question 10-2
# What is the difference between the library and require functions?
# 
# Question 10-3
# What is a package library?
# 
# Question 10-4
# How might you find the locations of package libraries on your machine?
# 
# Question 10-5
# How do you get R to pretend that it is Internet Explorer?


#--------------------------------------------------------------------------------------------------------------------------------------
##Exercises##
# Exercise 10-1 
# Using R GUI, install the Hmisc package. [10]

#click packages on the bottom right screen of R, then click install.
#from there you can check mark a package you would like to install
#or go into cran or bioconductor directly and download


# Exercise 10-2
# Using the install.packages function, install the lubridate package. [10]
install.packages("lubridate")

# Exercise 10-3
# Count the number of packages that are installed on your machine in each library

myPackages <- installed.packages()
table(myPackages[, "LibPath"])

