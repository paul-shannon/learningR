#chapter 8 Flow Control and Loops NOTES:
#if takes a logical value and executes the next statement only if that value is TRUE 
#(only a single logical value for each if statment)
#Missing values aren’t allowed to be passed to if; doing so throws an error
#Where you may have a missing value, you should test for it using is.na:
if(is.na(NA)) message("The value is missing!") 

#the code after an else statement is executed when the if condition is FALSE: 
if(runif(1) > 0.5)
{ 
  message("more than .5")
} else
{
  message("less than .5")
}
#Important noteL the else statement must occur on the same line as the closing curly brace from the if 
#clause. If you move it to the next line, you’ll get an error.

#there is also else if and ifelse 
#ifelse takes three arguments:
  #The first is a logical vector of conditions. 
  #The second contains values that are returned when the first vector is TRUE. 
  #The third contains values that are returned when the first vector is FALSE
ifelse(rbinom(10, 1, 0.5), "Head", "Tail") 
#rbinom generates random list of 0s and 1s and ifelse helps stimulate a coin flip

# switch function=  first argument is an expression that returns a string, 
#followed by several named arguments that provide results when the name matches the first argument. 
#The names must match the first argument exactly, and you can execute multiple expressions by 
#enclosing them in curly braces

##Types of Loops: repeat, while, for 
# repeat loop just repeats until you make it stop
repeat
{
  message("Happy Groundhog Day!")
}

#while loops are like backwards repeat loops
#Rather than executing some code and then checking to see if the loop should end, 
#they check first and then (maybe) execute. 

#for loops are used when you know how many times you want to repeat
for(i in 1:5) message("i = ", i)

#another example
for(i in 1:5)
{
  j <- i ^ 2
  message("j = ", j)
}
#another example: 
for(month in month.name)
{
  message("The month of ", month)
}
#quiz 
#1. What happens if you pass NA as a condition to if? Error message comes up 
#2. What happens if you pass NA as a condition to ifelse? It won't do anything 
#3. What types of variables can be passed as the first argument to the switch function? 
#4. How do you stop a repeat loop executing?  include a break statement, press the escape button, quit R
#5. How do you jump to the next iteration of a loop? Insert "next" into your loop code.

#exercise 1 
two_d6 <- function(n)
{
  random_numbers <- matrix(
    sample(6, 2 * n, replace = TRUE),
    nrow = 2
  )
  colSums(random_numbers)
} 
score<- two_d6(1)
if (score %in% (c(2,3,12)))
  {
    game_status= FALSE  
    point<-NA 
  } else if (score %in% (c(7,11)))
 {
   game_status= TRUE  
   point=NA 
 }else 
 {
   game_status=NA 
   point=score  
 } 

#exercise 2
if (game_status=NA) 
  {
  repeat ({
    if (score==7){
      (game_status=FALSE) 
      break 
    }else 
      if(score==point) 
      {
        game_status=TRUE
        break 
      }
  })
}

if(is.na(game_status))
{
  repeat({
    score <- two_d6(1)
    if(score == 7)
    {
      game_status <- FALSE
      break
    } else
      if(score == point)
      {
        game_status <- TRUE
        break
      }
  })
}

