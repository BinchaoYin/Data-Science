#

rankall <- function(outcome, num = "best"){
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #intemediate dataset
  outcomes <- data.frame(syndrome = c("heart attack", "heart failure", "pneumonia")
                         , colNum = c(11, 17, 23))
  
  ## Check that outcome are valid
  if(!outcome %in% outcomes$syndrome )
    stop("invalid outcome")
  
  ## For each state, find the hospital of the given rank
  res <- data.frame(hospital = character(length(unique(df$State))), state = sort(unique(df$State)), stringsAsFactors = FALSE, row.names = sort(unique(df$State)))
  
  colNum <- outcomes[outcomes$syndrome == outcome, 2]
  colNam <- names(df)[colNum]
  for(i in 1:length(res$state)){
    stateDf <- df[df$State == res$state[i],]
    stateDf[,colNum] = as.numeric(stateDf[,colNum])
    stateDf <- stateDf[!is.na(stateDf[,colNum]),]
    stateDf <- stateDf[order(stateDf[,colNum], stateDf$Hospital.Name),]
    motality <- stateDf[,colNum]
    if(num == "best")
      hos <- stateDf$Hospital.Name[1]
    else if(num == "worst")
      hos <- stateDf$Hospital.Name[length(stateDf$Hospital.Name)]
    else
      hos <- stateDf$Hospital.Name[num]
    res$hospital[i] <- hos
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  res
}
