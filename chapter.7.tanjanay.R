##Chapter 7 Notes##

String
# element of a character vector, indictated by quotations
c() 
# creates character vectors
paste(c()) 
# combines strings together
paste0(c())
# same as paste(c()) but has no separator
Sep= "symbol" 
# separates the strings with a symbol or space, depending on what you type.
# ex: sep="\t" separates the string by a tab/space
toString() 
# a variation of paste that is useful for printing vectors
Width= # 
# limits the output to an integer
Cat 
# works similar to paste but has less formatting. It can accept a file argument to write its output to a file.
# example of using cat
cat(c("red", "yellow"), "lorry")
# should print as ## red yellow lorry
noquote()
# suppresses quotes
digits = #
# the number of sig figs
formatC()
# specifies fixed or scientific formatting, including sig figs & width of output
# input should be numeric, while output should be a character vector (strings of the numeric values from input) or array
format = "e"
# causes the output to be in scientific notation
flag = "+"
# indicates each value in the output as positive. this can be done with "-" too
%s
# placeholder that denotes another string
%f
# placeholder that denotes a floating-point # in fixed notation
%e
# playholder that denotes a floating-point # in scientific notation
sprintf
# first argument contains placeholders^^^ for string or number variables. 
# further arguments are substituted into thes placeholders
# c-style formatting
fill= TRUE
# makes the function cat move the curosr to a new line once it is finished
\n
# in the middle of the string, it will print a newline character wherever it is placed
\0
# null character
# used to terminate strings in R's internal code
\<any other symbol>, ex: \'
# will separate strings by ' #or another symbol
\a
# alarm character
# can be added to the end of a long analysis to notify you when its finished
toupper
# uppercase all letters in the string
tolower
# lowercase all letters in the string
substring()
# extracts substrings
# the ouput is as long as the longest input
substr()
# same as as substring except that the output is as long as the first input
strsplit()
# splits a string by splitting them at specified cut points
# returns a list
? argument in strsplit()
# makes the previous character optional
file.path
# can construct a path from individual directory names (put them directories in strings)
path.expand()
# converts relative paths to absolute paths
basename
# returns the name of a file without the preceding directory location
dirname
# returns the name of a directory a file is in

factor
# a variable type for storing homo/categorical variables and levels
# sometimes behave like strings, sometimes behave like integers
# can be created using the factor function
class()
# inspects class of an object/variable
# can be character, numeric, data.frame, factor, etc
levels()
# the choices in a factor, called levels, will be retrieved
nlevels()
# states an integer of how many levels in the factor


