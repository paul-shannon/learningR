#Chapter 7 Notes
# strings= element of a character vector
# You should use double quotes most of the time
# single quotes are better for including inside the string
# The paste function combines strings together
# We can change the separator by passing an argument called sep, or use the related function paste0 to have no separator
# > paste("cat",'dog','mouse')
# [1] "cat dog mouse" 

# > paste0("cat",'dog','mouse')
# [1] "catdogmouse"
# 
# The toString function is a variation of paste that is useful for printing vectors
# It separates each element with a comma and a space, and can limit how much we print. 
# In the following example, width = 40 limits the output to 40 characters: 
  
  x <- (1:15) ^ 2 
toString(x) 
## [1] "1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225" 

toString(x, width = 40) 
## [1] "1, 4, 9, 16, 25, 36, 49, 64, 81, 100...."

# The cat function is a low-level function that works similarly to paste, but with less formatting

# formatC() uses C-style formatting specifications that allow you to specify fixed or scientific 
#formatting (for scientific do: format = "e"), the number of decimal places (digits=3), and the 
#width of the output (width=5),  flag = "+" (give positive numbers a plus sign)

# formatC(listOfNumbers, digits = 3, width = 10, format = "e", flag = "+") 

# sprintf()  provides slightly more general C-style formatting
# The first argument to sprintf specifies a formatting string ( %s denotes another string, %f and %e denote a floating-point number in fixed or scientific format, respectively, and %d represents an integer) 


#sprintf("%s %d = %f", "Mariam’s List Of Numbers", counter(you can write 1:3), listOfNumbers)
## [1] "Mariam’s List Of Numbers 1 = 2.718282" 
## [2] "Mariam’s List Of Numbers 2 = 7.389056" 
## [3] "Mariam’s List Of Numbers 3 = 20.085537"

#we can insert a tab character using \t. 
#> cat("foo\tbar")
#foo	bar

#Backslash characters need to be doubled up so that they aren’t mistaken for a special character. The two input backslashes make just one backslash in the resultant string: 
  
#  > cat("foo\\bar") 
## foo\bar

#Capitalizing and lower casing strings 
toupper("I'm Shouting") ## [1] "I'M SHOUTING" 
tolower("I'm Whispering") ## [1] "i'm whispering"

# Not a big difference between these functions except:
#   substring() =  the output is as long as the longest input- does the opposite of paste
# substr()= the output is as long as the first input

getwd() #Get working directory
setwd("c:/windows") #change working directory

# you can construct file paths from individual directory names using file.path. 
# This automatically puts forward slashes between directory names. 
# file.path("c:", "Program Files", "R", "R-devel") 
## [1] "c:/Program Files/R/R-devel"

# basename returns the name of a file without the preceding directory location
# dirname returns the name of the directory that a file is in
# 
# Factors= Factors are a special variable type for storing categorical variables. They sometimes behave like strings, and sometimes like integers.
# Categorical data is stored in factors (or ordered factors).
# Creating factors:
#   Char_fac <- factor(character vector, levels = c("male", "female"))



# factor= gender 
# levels(gender)= male, female 

# nlevels()=The number of levels 
# Levels- changes order of levels 
# factor(character vector, levels = c("male", "female"))
# Or 
# factor(Char_fac, levels = c("male", "female"))

# The relevel function is an alternative way of changing the order of factor levels. In this case, it just lets you specify which level comes first.
# relevel(gender_fac, "male")








#Chapter 7 Quiz 
#1. Name as many functions as you can think of for formatting numbers. sprintf, formatC, format
#2. How might you make your computer beep?  printing an alarm character, \a
#3  What are the classes of the two types of categorical variable? factor and ordered
#4  What happens if you add a value to a factor that isn’t one of the levels? The value is NA (missing)
#5  How do you convert a numeric variable to categorical? use cut function

#Chapter 7 Exercises 
#1 Display the value of pi to 16 significant digits. 
formatC(pi, digits = 16) 

#2 Split these strings into words, removing any commas or hyphens:
x <- c(
  "Swan swam over the pond, Swim swan swim!",
  "Swan swam back again - Well swum swan!"
  ) 
strsplit(x, ",? -? ?")
