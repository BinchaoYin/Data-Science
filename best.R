#caremeasure <-read.csv("outcome-of-care-measures.csv", colClasses = "charater")

#outcome[,11]<-as.numeric(outcome[,11])
#hist(outcome[,11])

best <- function(state, outcome){
  #read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #intemediate dataset
  outcomes <- data.frame(syndrome = c("heart attack", "heart failure", "pneumonia")
                         , colNum = c(11, 17, 23))
  
  #check that state and outcome are valid
  if(!state %in% df$State)
    stop("invalid state")
  
  if(!outcome %in% outcomes$syndrome )
    stop("invalid outcome")
  
  #return hospital name in that state with lowest 30-day death
  stateDf <- df[df$State == state,]
  motality <- suppressWarnings(as.numeric(stateDf[,outcomes[syndrome == outcome, 2]]))
  hos <- subset(stateDf, motality == min(motality, na.rm = TRUE), select = Hospital.Name)
  # rate
  sort(hos$Hospital.Name)[1]
}
