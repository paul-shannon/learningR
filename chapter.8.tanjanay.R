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
# first argument is an expression that returns astring, 
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
# skip the rest of thecurrent iteration and start the next iteration.
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







