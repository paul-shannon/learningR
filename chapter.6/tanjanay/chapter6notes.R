#function #1: hypotenuse

hypotenuse <- function(x, y)
{
  sqrt(x^2 +y^2)
}  
#since the function is only one line, you can remove the brackets:
hypotenuse <- function(x, y) sqrt(x^2 +y^2)
hypotenuse(5,12)

#here's an example with default values:
hypotenuse <- function(x=5, y=12)
{
  sqrt(x^2 +y^2)
}
hypotenuse() #should be equal to hypotenuse(5,12)
# [1] 13
formals(hypotenuse)
#$x
#[1] 5
#
#$y
#[1] 12
args(hypotenuse)
#function (x = 5, y = 12) 
#NULL
formalArgs(hypotenuse)
#[1] "x" "y"
#------------------------------------------------------------------------
#passing functions to and from other functions
#example: the "do.call" function allows you to pass args as a list rather than one at a time
do.call(hypotenuse, list(x=3, y=4))
#[1] 5; the same as hypotenuse(3,4)

#try using "rbind" and "do.call" together, which can allow you to link together multiple dataframes/matrices at once
dfr1<- data.frame(x=1:5, y=rt(5, 1))
dfr2 <- data.frame(x= 6:10, y= rf(5, 1, 1))
dfr3 <- data.frame(x= 11:15, y= rbeta(5, 1, 1))
do.call(rbind, list(dfr1, dfr2, dfr3)) #same as rbind(dfr1, dfr2, dfr3)
#    x           y
#1   1  0.17693615
#2   2 -0.26316907
#3   3 -0.26617788
#4   4  0.86000736
#5   5 -0.50835893
#6   6  1.00319122
#7   7  1.65342975
#8   8  0.08103588
#9   9  0.76545171
#10 10 18.00555863
#11 11  0.55727767
#12 12  0.71226081
#13 13  0.41272602
#14 14  0.19112289
#15 15  0.32388654
