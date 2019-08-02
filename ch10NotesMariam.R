#chapter 10 notes 
# There are thousands of R packages available from online repositories.
# You can install these packages with install.packages, and load them with library or require.
# When you load packages, they are added to the search path, which lets R find their variables.
# You can view the installed packages with installed.packages, keep them up-todate with update.packages, 
#and clean your system with remove.packages.

#QUIZ
#Question 10-1: What are the names of some R package repositories? Bioconductor, CRAN (biggest repo)
#Question 10-2: What is the difference between the library and require functions? 
  #both load the desired package, if it fails, library will return an error message
  #require will return a logical value
#Question 10-3: What is a package library? it is a place where all of the packages you installed are
#Question 10-4: How might you find the locations of package libraries on your machine? .libPaths (list of libraries)

#EXERCISES
# Exercise 1: Using R GUI, install the Hmisc package. 
#click the "packages" tab and press "install" and type in the package name
# Exercise 2: Using the install.packages function, install the lubridate package. 
install.packages(lubridate)
# Exercise 3: Count the number of packages that are installed on your machine in each library
nrow(installed.packages())
