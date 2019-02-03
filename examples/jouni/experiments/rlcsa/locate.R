# Use R --slave --args name [legend] < locate.R 

args = commandArgs()
name = args[4]

x = 4
y = 4

fullname = paste("locate_", name, sep = "")
pdf(file = paste(fullname, ".pdf", sep = ""), width = x, height = y, paper = "special", family = "Helvetica")
data = read.csv(file = paste(fullname, ".csv", sep = ""), head=TRUE, sep=";", dec=",")
par(mar=c(4, 4, 1, 1))

plot(data[1:4,2],
  data[1:4,3],
  type = "b",
  xlab = "Size (MB)",
  ylab = "Time (µs / occurrence)",
  xlim = c(0, 150),
  ylim = c(0, 80),
  pch = 20)
points(data[5:8,2], data[5:8,3], type = "b", pch = 21)
points(data[9:12,2], data[9:12,3], type = "b", pch = 22)

if(length(args) > 4)
{
  legend(150, 80, xjust = 1, yjust = 1, c("RLCSA", "RLCSA-OPT", "Sad-CSA"), pch = c(20:22))
}

dev.off()
q()
