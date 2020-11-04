read_files <- function(directory, id=1:332) {
  # locate the files
  # here we get all full files names that we need to read
  files <- list.files(directory, full.names=T)[id]
  
  # function lapply(x, fun) execute function 'fun' over each element in list 'x'
  # and returns list of the results
  # so here we read all content of files in 'file' list into a 'data_list' list
  data_list <- lapply(files, read.csv)
  
  return (data_list)
}

pmean <- function(directory, pollutant, id=1:332) {
  data_list <- read_files(directory, id)
  
  # 'data_list' list is the list that contains data.frames from all needed files
  # so here we merge list of data.frames into one big data.frame
  data <- do.call(rbind, data_list)
  
  # use 'mean' function to find average level of certain kind of pollution and ignore na values
  result <- mean(data[,pollutant], na.rm = TRUE)
  return (result)
}

complete <- function(directory, id) {
  data_list <- read_files(directory, id)
  
  # so here we count number of complete cases for each list in data_list
  # (one list per id) 
  # sapply functions acts like lapply but returns a vector
  nobs <- sapply(data_list, function(x) { sum(complete.cases(x)) })
  
  #create result as data frame with ids and number of complete cases
  result <- data.frame(id, nobs)
  
  return (result)
}

corr <- function(directory, threshold = 0) {
  data_list <- read_files(directory)
  
  # overwrite 'data_list' list of data.frames so data.frames(monitors) have only complete cases
  data_list <- lapply(data_list, function(x) { x[complete.cases(x),] })
  
  # filter 'data_list' list so we have only list of data.frames where number of complete cases are more than threshold value 
  # and in result we have 'filtered_list' list with needed monitors
  filtered_list <- Filter(function(x) { nrow(x) > threshold }, data_list)
  
  # return empty vertor if filtered_list is empty 
  # (if there are no monitors that have number of complete cases > threshold value)
  if (length(filtered_list) == 0) {
    return (c())
  }
  
  # get vector of sulfate and nitrate correlation per each monitor
  cors <- sapply(filtered_list, function(x) { cor(x[,'sulfate'], x[,'nitrate']) })
  return (cors)
  
}