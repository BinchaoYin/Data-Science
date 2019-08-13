complete<- function(directory, id =1:332){
  nobs <- vector(mode = "integer", length = length(id))
  ##data.frame(row.names = "")
  for (i in seq_along(id)){
    df <- read.csv(sprintf("%s/%03d.csv", directory, id[i]))
    nobs[i] <- nrow(na.omit(df))
  }
  data.frame("id" = id, "nobs" = nobs)
}