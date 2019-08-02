#chapter 9 Advanced Looping NOTES:
#The apply family of functions provide cleaner code for looping.
#Split-apply-combine problems, where you manipulate data split into groups, are really common.
#The plyr package is a syntactically cleaner replacement for many apply functions.

#rep will repeat the same random number several times, but replicate gives a different number each time

##lapply, short for “list apply.” lapply takes a list and a function as inputs, 
#applies the function to each element of the list in turn, and returns another list of results
  #One of the drawbacks of lapply is that it only accepts a single vector to loop over.
  #Another is that inside the function that is called on each element, you don’t have access
  #to the name of that element.
    #The function mapply, short for “multiple argument list apply,” lets you pass in as many
    #vectors as you like, solving the first problem. A common usage is to pass in a list in one
    #argument and the names of that list in another, solving the second problem.

#vapply stands for “list apply that returns a vector.” 
#As before, you pass it a list and a function, but vapply takes a third argument that is a template 
#for the return values. Rather than returning a list, it simplifies the result to be a vector or an array

#sapply, which stands for “simplifying list apply.” Like the two other functions, sapply takes a list and
#a function as inputs. It does not need a template, but will try to simplify the result to an
#appropriate vector or array if it can

#you can only pass one vectorized argument in lapply, sapply,vapply 

#rowSums()= gives the sum of each of the rows 

sapply(list(), length)
vapply(list(), length, numeric(1))

#The apply function provides the row/column-wise equivalent of lapply, 
#taking a matrix, a dimension number, and a function as arguments. 

#dir returns the names of files in a given directory, defaulting to the current working directory.

#QUIZ 
#1. Name as many members of the apply family of functions as you can. lapply, sapply, vapply, tapply,mapply, apply
#2. What is the difference between lapply, vapply, and sapply? all of them apply a function over a list or vector. 
#lapply returns a list 
#vapply returns a vector
#sapply can return either

#3. How might you loop over tree-like data? use rapply
#4. Given some height data, how might you calculate a mean height by gender? Use tapply (split-apply-combine problem)
#5. In the plyr package, what do the asterisks mean in a name like **ply?  they denote the form of input&output

# EXERCISES: 
#1.  How many children does each of the first generation of Wayanses have?

wayans <- list(
  "Dwayne Kim" = list(),
  "Keenen Ivory" = list(
    "Jolie Ivory Imani",
    "Nala",
    "Keenen Ivory Jr",
    "Bella",
    "Daphne Ivory"
  ),
  Damon = list(
    "Damon Jr",
    "Michael",
    "Cara Mia",
    "Kyla"
  ),
  Kim = list(),
  Shawn = list(
    "Laila",
    "Illia",
    "Marlon"
  ),
  Marlon = list(
    "Shawn Howell",
    "Arnai Zachary"
  ),
  Nadia = list(),
  Elvira = list(
    "Damien",
    "Chaunté"
  ),
  Diedre = list(
    "Craig",
    "Gregg",
    "Summer",
    "Justin",
    "Jamel"
  ),
  Vonnie = list()
)
vapply(wayans, length, integer(1))

#2. Find the mean and standard deviation of each column in state.x77 dataset 
#Since the dataset is a matrix, use apply
apply(state.x77,2, mean)
apply(state.x77, 2, sd)

#more practice
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
    bike = rnorm(1, 60, 5)
  )
  names(time) <- mode_of_transport
  time
}
commute_times <- replicate(1000, time_for_commute())
commute_data <- data.frame(
  time = commute_times,
  mode = names(commute_times)
)
ddply(commute_data, .(mode), summarize, time_p75 = quantile(time, 0.75))
#OR 
with(commute_data, tapply(time, mode, quantile, prob = 0.75))
