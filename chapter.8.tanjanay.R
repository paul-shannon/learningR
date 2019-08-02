##Chapter 8 Notes##
##Flow Control and Loops##

if
# takes a logical value (more precisely, a logical vector of length one) and executes the next statement if TRUE
# missing values (NA) cannot be passed so an error occurs

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

is.na
# tests for a missing value
else
# Code that follows an else statement is executed if the if condition was FALSE
# must occur on the same line as the closing curly brace from the if clause
else if
# Multiple conditions can be defined by combining if and else repeatedly
Re
# returns the real component of a complexnumber 
Im
# returns the imaginary component
rbinom
# generates random numbers from abinomial distribution (ex: to simulate a coin flip)
ifelse
# vectorized flow control
# takes three arguments.The first is a logical vector of conditions. 
# The second contains values that are returnedwhen the first vector is TRUE
# The third contains values that are returned when the first vector is FALSE
# can also accept vectors in the second and third arg
switch
# prettier way of using multiple else conditions
# first argument is an expression that returns a string, 
# followed by several named args that provide results when the name matches the first arg.
# can execute multiple expressions by enclosing them in curly braces
# if no names match, it returns NULL
repeat
# easiest loop
# execute the same code over and over until you tell it to stop
break
# break out of the loop
sample
# returns one action in each iteration of the loop
next
# skip the rest of the current iteration and start the next iteration.
while 
# they check the loop first should end first and then (maybe) execute
# think of it as a backwards repeat loop

# format:
while (condition){
  Do_something
}
#example
while (i < 5){
  print(i)
  i <- i + 1
}#prints 5

for 
# to be used when you know exactly how many times you want the code to repeat.
# accepts an iterator variable and a vector. It repeats the loop, giving the 
#iterator each element from the vector in turn.
  
# format:
for (variable in sequence){
  Do_something
}
#example:
for (i in 1:4){
  j <- i + 10
  print(j)
} #prints out 11, 12, 13, 14
#--------------------------------------------------------------------------------------------------------
##Quiz##
# Question 8-1
# What happens if you pass NA as a condition to if?
# Missing values cannot be be so an error occurs

# Question 8-2 
# What happens if you pass NA as a condition to ifelse ?
# it would return NA values corresponding to the positions that NA was passed to 

# Question 8-3
# What types of variables can be passed as the first argument to the switch function?
# an expression that returns a string

# Question 8-4 
# How do you stop a repeat loop executing?
# use break

# Question 8-5
# How do you jump to the next iteration of a loop?
# use next

#--------------------------------------------------------------------------------------------------------
##Exercises##

#Exercise 8-1
# In the game of craps, the player (the “shooter”) throws two six-sided dice. 
# If the total is 2, 3, or 12, then the shooter loses. If the total is 7 or 11, she wins. 
# If the total is any other score, then that score becomes the new target, known as the 'point.'
# Use this utility function to generate a craps score:
two_d6 <- function(n)
  { random_numbers <- matrix( 
      sample(6, 2 * n, replace = TRUE), 
      nrow = 2 
  ) 
  colSums(random_numbers)
  }
# Write code that generates a craps score and assigns the following values to the variables
# game_status and point:

score <- two_d6(1)
if(score %in% c(2, 3, 12))
  # side note: %in% checks the condition
{
  game_status <- FALSE
  point <- NA
  # the shooter loses
} else if(score %in% c(7, 11))
{ 
  game_status <- TRUE
  point <- NA
  # the shooter wins
} else
{
  game_status <- NA
  point <- score
}

#Exercise 8-2
#If the shooter doesn’t immediately win or lose, then he must keep rolling the dice
# until he scores the point value and wins, or scores a 7 and loses. 
# Write code that checks to see if the game status is NA, and if so, 
# repeatedly generates a craps score until either the point value is scored 
# (set game_status to TRUE ) or a 7 is scored 
# (set game_status to FALSE). [15]

if(is.na(game_status))
{
  repeat({
    score <- two_d6(1)
    if(score == 7)
  {
    game_status <- FALSE
    break #stop loop
  } else if(score==point)
    {
      game_status <- TRUE
      break #stop loop
    }  
  })
}

##Exercise 8-3##
sea_shells <- c( "She", "sells", "sea", "shells", "by", "the", "seashore", 
                 "The", "shells", "she", "sells", "are", "surely", "seashells", 
                 "So", "if", "she", "sells", "shells", "on", "the", "seashore", 
                 "I'm", "sure", "she", "sells", "seashore", "shells")
# Use the nchar function to calculate the number of letters in each word. 
# Now loopover possible word lengths, displaying a message about which words have that length.
# For example, at length six, you should state that the words “shells” and“surely” have six letters.
nchar_sea_shells <- nchar(sea_shells)
for(i in min(nchar_sea_shells):max(nchar_sea_shells))
    #from 2 characters to 9 characters
  {
    message("These words have ", i, " letters:")
    print(toString(unique(sea_shells[nchar_sea_shells == i])))
  #I used the books solution for this^ last line
  #But here is what I learned from the solution:
  #toString(): produces a single-character string from the R object (from chapter 7 but needed refresh)
  #unique: returns a vector with dupe rows/elements removed. This is done because some 
  #words are used multiple times. Only necessary to mention each word one time (also from chapter 7)  
}