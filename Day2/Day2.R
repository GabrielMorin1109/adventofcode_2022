Day2 <- function(){
  require(data.table)
  # path to wd
  path.wd <- dirname(rstudioapi::getSourceEditorContext()$path)
  setwd(path.wd)
  dd <- fread("Data/input.txt", header = F)
  
  # frequency table
  tmp <- table(paste0(dd$V1, dd$V2))
  # SOL 1:
  ans1 <-
    sum(table(dd$V2) * c(1, 2, 3)) +                        # hand score  
    sum(tmp[names(tmp) %in% c("AX", "BY", "CZ")] * c(3))  + # draw
    sum(tmp[names(tmp) %in% c("AY", "BZ", "CX")] * c(6))    # Win
  score <- rep(NA, length(tmp))
  names(score) <- names(tmp)
  # score for: hand + Lose/draw/winning
  score[c(1 + 3 * (0:2))] <- c(3, 1, 2) + 0  # lose (X=0)
  score[c(2 + 3 * (0:2))] <- 1:3 + 3         # draw (Y=3)
  score[c(3 + 3 * (0:2))] <-  c(2, 3, 1) + 6 # WIN (Z = 6)
  ans2 <- sum(score * tmp)
  # OUTPUT
  return(list(ans1 = ans1, ans2 = ans2))
}
Day2()

# $ans1
# [1] 11906
# 
# $ans2
# [1] 11186