##working directories:
getwd()
##Find the current working directory (where inputs are found and outputs are sent).
setwd("C://file/path")
##Change the current working directory. 

##lists: A list is collection of elements which can be of different types.
l <- list(x = 1:5, y = c('a', 'b'))
l[[2]] 
#is the second element of l
#double brackets are more specific that single brackets
#double brackets focus on the specific element in a list or data frame
#while single brackets create a new list or data frame specifying the element
l[1] 
#is a new list with only the first element.
l$x 
# Element named x. 
l['y'] 
# New list with only element named y.

install.packages("RUnit")
#Download and install a package from CRAN.
library(RUnit)
#Load the package into the session, making all its functions available to use.
RUnit::select
#Use a particular function from a package.
data(iris)
#Load a build-in dataset into the environment. 

##passing functions onto functions, using exclamation points 
#making lists in R 
x<- list(3,"cat") 

# making a named list
x<- list(number=3,string="cat") 

# pulling off parts from a list needs x[[]] for the contents:
x[[number]]

#get names of the list: 
names(x)

# creating a vector (example): 
phoneNumber=c(206,123,4567)
phoneNumber

#difference between a list and vector:
#a list has heterogenous elements while a vector has homogenous elements

#matrix is a data structure that has homogenous elements

#selecting vector elements
x[4] 
#The fourth element (position)
x[-4] 
#All but the fourth (position)
x[2:4] 
#Elements two through four (position)
x[-(2:4)] 
#All elements except two to four (position)
x[c(1, 5)] 
#Elements one and five (position)
x[x == 10] 
#Elements which are equal to 10 (value)
x[x < 0]
#All elements less than zero (value)
x[x %in% c(1, 2, 5)]
#Elements in the set 1, 2, 5.(value)
x['apple'] 
#Element with name ‘apple’ (vectors)

#practice with for loops
# format:
for (variable in sequence){
  Do_something
}
#example:
for (i in 1:4){
  j <- i + 10
  print(j)
} #prints out 11, 12, 13, 14


# practice with while loop
# format:
while (condition){
  Do_something
}
#example
while (i < 5){
print(i)
i <- i + 1
}#prints 5

#practice with if statements
#format
if (condition){
  Do_something
} else {
  Do_something_different
}
#example:
if (i > 3){
  print('Yes')
} else {
  print('No')
}

#Practice with making functions and tests
#format
function_name <- function(parameters){
  Do_something/body
  return(new_variable)
}

#example
divideBy <- function(dividend, divisor) {
  if (divisor == 0)
    return(NA)
  dividend / divisor
}
test_divideBy <- function() {
  checkEquals(divideBy(4, 2), 2)
  checkTrue(is.na(divideBy(4, 0)))
  checkEqualsNumeric(divideBy(4, 1.2345), 3.24, tolerance=1.0e-4)
}

cbind(0, matrix(1, nrow = 0, ncol = 4)) #> Warning (making sense)
dim(cbind(0, matrix(1, nrow = 2, ncol = 0))) #-> 2 x 1

## deparse.level
dd <- 10
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 0) # middle 2 rownames
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 1) # 3 rownames (default)
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 2) # 4 rownames

## cheap row names:

x <- data.frame(alpha=letters[1:3], num=1:3 )
n <- 4
xc <- data.frame( rep( x, n ) )
xc

#lapply- Apply a Function over a List or Vector.
lapply("cat","dog","goose")
#practice with lapply
grep("[a-z]", letters)
lapply(c("cat", "dog", "goose"),nchar(rep("cat", 20)))
1:10
1:100
animals <- c("cat", "dog", "goose")
sizes <- lapply(animals, function(s) nchar(s))
names(sizes) <- animals
rep("cat", 5)
paste(rep("cat", 5), collapse="")         

#conditions
a == b 
#Are equal 
a > b 
#Greater than 
a >= b 
#Greater than or equal to 
is.na(a)
#is missing
a != b 
#Not(!) equal 
a < b
#Less than 
a <= b 
#Less than or equal to 
is.null(a) 
#Is null 

#class()- gives the class of the parameter you enter: numeric, character, logical (True/False), data frame, factors (strings with preset levels)
#data types
as.logical
#TRUE, FALSE, TRUE 
#Boolean values (TRUE or FALSE).
as.numeric 
#1, 0, 1 
#Integers or floating point numbers.
as.character 
#'1', '0', '1' 
#Character strings. Generally preferred to factors.
as.factor 
#'1', '0', '1', 
#levels: '1', '0'
#Character strings with preset levels. Needed for some statistical models. 

#environment
ls() 
#List all variables in the environment.
rm(x) 
#Remove x from the environment.
rm(list = ls()) 
#Remove all variables from the environment
#----------------------------------------------------------------------------------------------------------------------
#plotting mtcars:
mtcars
model <- lm(formula = mpg ~ disp, data = mtcars)
model
summary(model)
plot(mtcars$disp, mtcars$mpg)
abline(model, col="red")
#----------------------------------------------------------------------------------------------------------------------
#Instructions on how to use GitHub using RStudio:

#First, login to Github.
#To create a repository for R, click the green button “New” when you go into “your repositories” tab. 
#Make sure to make a repository name (one that may correlate with a project), 
#make sure it is public so it can she shared among colleagues and mentors, and add a “gitignore” and scroll down 
#(or search for) R so it can be cloned into RStudio.

#Terminal Commands (may be in order):

#cd - allows me to go back to home directory “user$”. To get into the “GitHub” directory, do “cd github” from the home directory.

#Mkdir “<name of wanted directory>”- allows you to create a directory from whatever directory you are in. Think of it as adding another folder to your binder. Do “cd ‘directory name’ once constructed.

#git clone “<repository link from GitHub>”- copies the repository into RStudio

#ls -l -lists whatever is in current directory

#pwd- print working directory (usually used to see where you are working at)

#Cat <file name>- to read a file

#Filename1 > filename2 - replacing filename2 with filename 1
#Filename1 >> filename2 - adding on filename1 to filename2

#To push a file on GitHub: 1. git add <filename> 2. git commit -m “<give name for file>” 3. git push

#cp ~/<Path/To/File\ .name.txt> - copy a file into the directory

#mv filename1.pdf filename2.pdf - move a file to another
