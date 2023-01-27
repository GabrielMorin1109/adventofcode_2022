#!/usr/bin/env Rscript
Day1 <- function(){
  require(data.table)
  data.table::setDTthreads(threads = 2)
  # path to wd 
  path.wd <- dirname(rstudioapi::getSourceEditorContext()$path)
  setwd(path.wd)
  # read data:
  dd <- data.table::fread("input.txt")
  # data.table::setnames(dd, new = 'Elf') # for better reading 
  # Create a group column exploiting the rows with NA
  dd[, Grp := cumsum(is.na(V1)) + 1]
  # sum by group
  tmp <- dd[, .(cumV1 = sum(V1, na.rm = TRUE)), Grp]
  tmp[, {
    .n = .N # number of rows
    .range = .n:(.n - 2) # save in memory the select range to limit the number of copies
    .n.largest = sort(cumV1,  partial = .range)[.range] # partial sorting is faster than normal sorting
    .(sol1 = .n.largest[1], sol2 = sum(.n.largest)) # final solution:
  }]
}
# BENCHMARK:
microbenchmark::microbenchmark("Day1" = {
  Day1()
})
data.table::setDTthreads(threads = 12)
