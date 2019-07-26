#Exercise 6.1:
#Create a new environment named multiples_of_pi. Assign these variables into the environment (new.env()) :
#1.two_pi, with the value 2 * π, using double square brackets ([[""]])
#2.three_pi, with the value 3 * π, using the dollar sign operator($)
#3.four_pi, with the value 4 * π, using the assign function.(assign("variable", value, environment))
#List the contents of the environment, along with their values. [10] (ls.str for values, ls for just the variables)

multiples_of_pi <- new.env()
multiples_of_pi[["two_pi"]] <- 2 * pi
multiples_of_pi$three_pi <- 3 * pi
assign("four_pi", 4 * pi, multiples_of_pi)
ls.str(multiples_of_pi)
#----------------------------------------------------------------------------------------------------------------------------
#Exercise 6.2:
#Write a function that accepts a vector of integers (for simplicity, you don’t have to worry about input checking) 
#and returns a logical vector that is 
#TRUE whenever theinput is even,
#FALSE whenever the input is odd, and
#NA whenever the input is non‐finite 
#(nonfinite means anything that will make is.finite return FALSE:Inf,-Inf,NA, and NaN). 
#Check that the function works with positive, negative, zero, and non‐finite inputs. [10]

evenNumbers <- function(x) ((x %% 2) == 0)
# A number is even if it is divided by 2 & gives a remainder of 0.
# no brackets because it is only one line :)
evenNumbers(50)
#[1] TRUE
evenNumbers(49)
#[1] FALSE
#now lets use a vector of numbers...
evenNumbers(c(20, -1, 0, 4, -Inf, NA))
#[1]  TRUE FALSE  TRUE  TRUE    NA    NA
#----------------------------------------------------------------------------------------------------------------------------
#Exercise 6.3:
#Write a function that accepts a function as an input and returns a list with two elements: 
#an element named args that contains a pairlist of the input’s formal arguments, 
#and an element named body that contains the input’s body. 
#Test it by calling the function with a variety of inputs. [10]

#Mariam and I had trouble understanding this :(
#Can we go over it on Monday @11?

randomFunction <- function(abc)
  ...?
  
