pollutantmean <- function(directory, pollutant, id =1:332){
  sum <- 0
  count <- 0
  for (i in id){
    df <- read.csv(sprintf("%s/%03d.csv", directory, i))
    sum <- sum + sum(df[,pollutant], na.rm = TRUE)
    count <- count + length(na.omit(df[,pollutant]))
  }
  sum/count
}