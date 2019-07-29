# Cotton, Richard. Learning R
#
# exercise 6.3
#
# Write a function that accepts a function as an input and returns a list with two elements: an element
# named args that contains a pairlist of the input’s formal arguments, and an element named body that
# contains the input’s body. Test it by calling the function with a variety of inputs.
#
# a good thing:  when writing code that needs to DO something, include a test to make sure that it does so
# we will use RUnit to help us to that
library(RUnit)
# this is an initially confusing exercise.
# faced with something I don't initially understand, my usual strategy is to look
# for a pieice of it which I DO understand.
#
# in this case, "return a list with two elements".
# i will sneak up on the problem, learn the terrain, and only aspire
# to returning one thing - the formal args of the function

outer.v1 <- function(func)
{
   return(formals(func))
}

helloSomebody <- function(who, punctuation="!")
{
   return(sprintf("hello %s%s", who, punctuation))
}

checkEquals(helloSomebody("world"), "hello world!")
checkEquals(helloSomebody("world", "."), "hello world.")

# let's now make sure we know the formal arguments of helloSomebody
formals(helloSomebody)

# pairlists are weird.  they are used extensively in R internals (the guts of the R interpreter)
# but rarely by users like you and me.  it convert them to something more familiar: a vector of strings
# then check that they are what is expected
formals.of.function <- formals(helloSomebody)

checkEquals(names(formals.of.function), c("who", "punctuation"))

# why does this work?
checkEquals(formals.of.function$punctuation, "!")

# okay.  so far so good: we can return a pairlist of the formal arguments of the supplied function:
checkEquals(outer.v1(helloSomebody), formals.of.function)


# your job,  sticking to the strategy:  SOLVE JUST ONE PROBLEM AT A TIME
# create a second version of the outer function which returns the body
# of the supplied function

outer.v2 <- function(func)
{
  return(body(func))
}

# after you have written that, make sure it passes a test like the following
# you can skip over the obscure "deparse" for now, except to know that
# it converts R's internal (processed) version of the function into human-readable
# strings

body.as.text <- deparse(outer.v2(helloSomebody))

# here is a weak test, simply insuring that one of the deparsed strings has "hello" in it
checkTrue(any(grepl("hello", body.as.text)))


# your final task in this exercise is to combine the two solutions offered (or suggested) above
# to  deliver what the exercise asks for.  evolve the function "outer" to return a list of two elements

outer <- function(func)
{
   list(args= outer.v1(func), body= outer.v2(func))
}


x <- outer(helloSomebody)
checkEquals(length(x), 2)
checkEquals(names(x), c("args", "body"))
result.args <- x[["args"]]
result.body <- deparse(x[["body"]])
checkEquals(names(result.args), c("who", "punctuation"))
checkTrue(grepl("hello", result.body[2]))

