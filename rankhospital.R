rankhospital <- function(state, outcome, num = "best"){
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
  
  #return hospital name in that state with lowest 30-day death rate
  colNum <- outcomes[outcomes$syndrome == outcome, 2]
  colNam <- names(df)[colNum]
  stateDf <- df[df$State == state,]
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
  hos
}
