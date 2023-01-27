#!/usr/bin/env Rscript
# path to wd 
path.wd <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(path.wd)

tmp <- read.table(file = "Data/input.txt")$V1

marker <- function(n){
  chr_seq = substr(tmp, 1, (n-1))
  next_bool = TRUE
  j <- (n-1)
  while (next_bool) {
    j <- j + 1
    next_cht = substr(tmp, j, j)
    chr_seq = paste0(chr_seq, next_cht)
    next_bool = any(duplicated(base::strsplit(chr_seq,"")[[1]]))
    chr_seq = sub('.', '', chr_seq)
    if(j>=nchar(tmp)) break
  } 
  return(j)
}
list('sol1' = marker(4),
     'sol2'= marker(14))
