#chapter 10 notes 
# There are thousands of R packages available from online repositories.
# You can install these packages with install.packages, and load them with library or require.
# When you load packages, they are added to the search path, which lets R find their variables.
# You can view the installed packages with installed.packages, keep them up-todate with update.packages, 
#and clean your system with remove.packages.

#QUIZ
#Question 10-1: What are the names of some R package repositories? Bioconductor, CRAN (biggest repo)
#Question 10-2: What is the difference between the library and require functions? 
  #both load the desired package, if it fails, library will return an error message
  #require will return a logical value
#Question 10-3: What is a package library? it is a place where all of the packages you installed are
#Question 10-4: How might you find the locations of package libraries on your machine? .libPaths (list of libraries)

#EXERCISES
# Exercise 1: Using R GUI, install the Hmisc package. 
#click the "packages" tab and press "install" and type in the package name
# Exercise 2: Using the install.packages function, install the lubridate package. 
install.packages(lubridate)
# Exercise 3: Count the number of packages that are installed on your machine in each library
nrow(installed.packages())

#------- 
retrieveMatches <- function(tf, motifName, chromosome, start.loc=NA, end.loc=NA, displayHistogram=FALSE, peakMode="narrow", fimoThreshold)
{quietly=FALSE
quiet=FALSE
library(RPostgreSQL)
library(FimoClient)
library(MotifDb)
library(org.Hs.eg.db)
pfms <- as.list(query(MotifDb, c("sapiens", tf, "jaspar2018", motifName)))
length(pfms)
fc <- FimoClient("khaleesi", 60010, quiet=FALSE)
db <- dbConnect(PostgreSQL(), user= "trena", password="trena", dbname="hg38", host="khaleesi")
tf <- tf
chrom <- chromosome
#default to small and make 

if(is.na(start.loc)){
  start.loc=1
}

if(is.na(end.loc)){
  truncated.chromosome.name <- as.character(sub("chr", "", chromosome))
  end.loc <- org.Hs.egCHRLENGTHS[[truncated.chromosome.name]]
}

query <- sprintf("select * from chipseq where tf='%s' AND chrom='%s' AND start >= %d AND endpos <= %d", tf, chromosome, start.loc, end.loc)
tbl.tf <- dbGetQuery(db, query)
dim(tbl.tf)
colnames(tbl.tf) #what are the colnames 
print(colnames(tbl.tf))

if(peakMode=="narrow"){
  startColumn <- "peakStart"
  endColumn <- "peakEnd"
  tbl.tf["chrom", startColumn, endColumn]  
}
if(peakMode=="broad"){
  startColumn <- "start"
  endColumn <- "endpos"
  tbl.tf["chrom", startColumn, endColumn]  
}

tbl.tf.adjusted <- tbl.tf[, c("chrom", "peakStart", "peakEnd")]
colnames(tbl.tf.adjusted) <- c("chrom", "start", "end")
tbl.tf.adjusted$start <- tbl.tf[,"start"]
tbl.tf.adjusted$end <- tbl.tf[,"endpos"]
dim(tbl.tf.adjusted)

tbl.motifs <- requestMatchForRegions(fc, tbl.tf, "hg38", fimoThreshold)
dim(tbl.motifs)

gr.chip <- GRanges(tbl.tf.adjusted)
gr.motifs <- GRanges(tbl.motifs)
tbl.overlaps <- as.data.frame(findOverlaps(gr.motifs, gr.chip, type="any"))
colnames(tbl.overlaps) <- c("motif", "chip")
chips.matched <- length(unique(tbl.overlaps$chip))
chips.unmatched <- nrow(tbl.tf.adjusted) - chips.matched
motifs.matched <- length(unique(tbl.overlaps$motif))
fimo.pValScores <- -log10(tbl.motifs$pValue)
dist <- fivenum(fimo.pValScores)
printf <- function(...) print(noquote(sprintf(...)))
printf("found motif match for %d/%d ChIP hits (%5.2f%%)",
       chips.matched, nrow(tbl.tf.adjusted), 100 * chips.matched/nrow(tbl.tf.adjusted))
printf("-log10(fimo pValue) range of %f %f %f %f %f",
       dist[1], dist[2], dist[3], dist[4], dist[5])
fimo.pValScores.withFailures <- c(fimo.pValScores, rep(-1, chips.unmatched))
if (displayHistogram) {
  hist(fimo.pValScores.withFailures,
       main=sprintf("JASPAR %s FIMO motif match to ChIP hits\n with %d failures (chr19)",tf, chips.unmatched),
       xlab="-log10(FIMO pValue)") 
}
}

retrieveMatches("CTCF", "MA0139.1", "chr15", start.loc=39109648, end.loc=39110469, displayHistogram=FALSE, peakMode="broad", .05)
retrieveMatches("CTCF", "MA0139.1", "chr3", start.loc=184278744, end.loc=184279631, displayHistogram=FALSE, peakMode="broad", .05)
