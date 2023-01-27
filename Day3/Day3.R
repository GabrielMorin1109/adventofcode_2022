# path to wd
path.wd <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(path.wd)
# read database
dd <- readLines("Data/input.txt")

Day3.part1 <- function(){
  # scoring vector
  score <- c(seq_along(letters), seq_along(LETTERS)+26)
  names(score) <- c(letters, LETTERS)
  # splits and resulting character vectors
  rucksack.delim <- sapply(dd, nchar, USE.NAMES = F)/2
  first.half <- mapply(substring, dd, 1, rucksack.delim)
  second.half <- mapply(substring, dd, rucksack.delim+1)
  
  # split each character ni the string
  first.unique.chr <- lapply(strsplit(first.half, split =  ""), unique)
  
  # loop to compute the total scoring
  incremental.score <- 0
  for(i in seq_along(first.unique.chr)){
    first.unique.chr.i <- first.unique.chr[[i]]
    order.of.score <-
      match(first.unique.chr.i, names(score) , nomatch = 0)
    # test for matching. Return a logical vector
    in.both.rucksack <- sapply(first.unique.chr.i, grepl, second.half[i])
    
    incremental.score <- incremental.score + 
      sum(score[order.of.score] * in.both.rucksack)
    
  }
  # final score
  return(incremental.score)
}
Day3.part1() # 7848



Day3.part2 <- function(){
  # extract unique character 
  dd.unique <- lapply(strsplit(dd, split =  ""), unique)
  incremental.score <- 0
  for(i in seq_len(.N.by.3)-1){
    row.id <- 1:3 + 3*i
    # we find the group when the table of each elf unique character is 3
    freq.bw.3.elfs <- table(unlist(dd.unique[row.id]))
    Elfs.tag <- names(which.max(freq.bw.3.elfs))
    
    incremental.score <- incremental.score + 
      score[names(score) %in% Elfs.tag]
  }
  return(incremental.score)
}
Day3.part2() # 2616
