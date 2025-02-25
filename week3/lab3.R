func1 <- function(x){
  vector_length <- as.character(length(x))
  max_vector <- as.character(max(x))
  print(paste("The largest value in that list of",vector_length,"is",max_vector))
}

func1(c(1, 2, 3, 5, 7))
