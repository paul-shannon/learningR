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



