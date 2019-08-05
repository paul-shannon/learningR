##Chapter 9 Notes##

rep()
#repeats the input several times
#if runif isn’t vectorized, rep() will repeat the same random number several times
replicate
#calls an expression several times
#if runif isn’t vectorized, replicate gives a different number each time
rnorm
#normal distribution
rlnorm
#log normal distribution

#example where replicate() is most useful (pretty complicated):
time_for_commute <- function()
{ 
  #Choose a mode of transport for the day 
  mode_of_transport <- sample(
    c("car", "bus", "train", "bike"),
    size = 1,
    prob = c(0.1, 0.2, 0.3, 0.4)
    ) 
  #Find the time to travel, depending upon mode of transport 
  time <- switch(
    mode_of_transport,
    car = rlnorm(1, log(30), 0.5), 
    bus = rlnorm(1, log(40), 0.5), 
    train = rnorm(1, 30, 10), 
    bike = rnorm(1, 60, 5),
    )
  names(time) <- mode_of_transport
  time
}
replicate(5, time_for_commute())
# replicate gives us instant vectorization in this scenario
# this step finds the distribution of commuting times
#end of example

lapply
# takes a list and a function as inputs, applies the function to each element of the list in turn, 
# returns another list of results.
vapply
# stands for “list apply that returns a vector.”
# you pass it a list and a function, but it takes athird argument that is a template for the return values. 
# Rather than returning a list, itsimplifies the result to be a vector or an array:
sapply
# "simplifying list apply" 
# takes a list and a function as inputs. 
# It does not need a template, but will try to simplify the result to anappropriate vector or array if it can
# length arg returns a vector, summary arg returns an array
source
# used to read and evaluate the contents of an R file
dir/getwd
#returns the names of files in a given directory, defaulting to the current working directory.
pattern = "\\.R$"
# means "only return filenames that end with .R"
eapply
# loop over every variable in an environment,rather than in a list.
rapply
# allows you to loop over nested lists.
# is a niche requirement, and code is often simpler if you flatten the data first using unlist
magic
#creates a magic square—an n -by- n square matrix of the numbersfrom 1 to n
#^2, where each row and each column has the same total
apply
# provides the row/column-wise equivalent of lapply
#taking a matrix, a dimension number, and a function as arguments. 
#The dimension number is 1 for “apply the function across eachrow,” or
#2 for “apply the function down each column”
#can be used on data frame, where apply behaves identically to sapply
mapply
#short for “multiple argument list apply,” lets you pass in as many  vectors as you like
#behaves more like lapply by passing theargument SIMPLIFY = FALSE
tapply
#split-apply-combine in one step
#split the dataset by category, apply the function to each element, then combine the result into a single vector
llply
#takes a list input, applies a function to each element, and returnsa list, making it a drop-in replacement for lapply
laply
#takes a list and returns an array, mimicking sapply
raply replaces replicate
rlply and rdply
# let you return the result in list or data frame form, and an
r_ply
#function that discards the result (useful for drawing plots)
ddply
#takes data framesas inputs and outputs and can be used as a replacement for tapply
#takes a data frame, thecname of the column(s) to split by, and the function to apply to each piece.
#can either use colwise to tell ddply to call the function on every column or use
#summarize and specify manipulations of specific columns
m*ply
#allow loopingwith multiple arguments.
#--------------------------------------------------------------------------------------------------------------------------------------
##Quiz##

# Question 9-1
# Name as many members of the apply family of functions as you can.
# lapply , vapply, sapply, apply, mapply, and tapply
# additionally, there's eapply and rapply

# Question 9-2
# What is the difference between lapply, vapply, and sapply?
# All three functions accept a list and apply a function to each element in turn. The difference is in the return value.
# lapply always returns a list, vapply always returns a vector or array as specified by a template, and
# sapply can return either.
  
# Question 9-3
# How might you loop over tree-like data?
# use rapply
   
# Question 9-4
# Given some height data, how might you calculate a mean height by gender?
# use tapply

# Question 9-5
# In the plyr package, what do the asterisks mean in a name like **ply?
# the first asterisk denotes the type of the first input argumentand the second asterisk denotes the type of the return value

#--------------------------------------------------------------------------------------------------------------------------------------

##Exercises##

Exercise 9-1
#Loop over the list of children in the celebrity Wayans family. How many childrendoes each of the first generation of Wayanses have?
  wayans <- list( 
    "Dwayne Kim" = list(), 
    "Keenen Ivory" = list( "Jolie Ivory Imani", "Nala", "Keenen Ivory Jr", "Bella", "Daphne Ivory" ), 
    Damon = list( "Damon Jr", "Michael", "Cara Mia", "Kyla" ),
    Kim = list(), 
    Shawn = list( "Laila", "Illia", "Marlon" ), 
    Marlon = list( "Shawn Howell", "Arnai Zachary" ), 
    Nadia = list(), Elvira = list( "Damien", "Chaunté" ), 
    Diedre = list( "Craig", "Gregg", "Summer", "Justin", "Jamel" ), 
    Vonnie = list())
#this^ is given

vapply(wayans, length, integer(1))  
  
Exercise 9-2
#state.x77 is a dataset that is supplied with R. It contains information about thepopulation, income, and other factors for each US state. 
#You can see its values by typing its name, just as you would with datasets that you create yourself:
  state.x77
# 1.Inspect the dataset using the method that you learned in Chapter 3.
  
class(stat. x77)  
#its a matrix

# 2.Find the mean and standard deviation of each column.

apply(stat. x77, 2, sd)
apply(stat. x77, 2, mean)

Exercise 9-3
#Recall the time_for_commute function from earlier in the chapter. 
#Calculate the75th-percentile commute time by mode of transport:
    commute_times <- replicate(1000, time_for_commute())
    commute_data <- data.frame( 
      time = commute_times, 
      mode = names(commute_times)
  #Given^

with(commute_data, tapply(time, mode, quantile, prob = 0.75))

    


