corr <- function(directory, threshold = 0){
  vcor <- vector(mode = "numeric")
  files <- list.files(directory)
  for(file in files){
    df <- na.omit(read.csv(sprintf("%s/%s", directory, file)))
    if(nrow(df) > threshold){
      cor <- cor(df[,2], df[,3])
      vcor <- append(vcor, cor)
    }
  }
  vcor
}