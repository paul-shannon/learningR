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
time_for_commute <- 
  function(){ 
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
