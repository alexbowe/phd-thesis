# Use R --slave < dna.R 

args = commandArgs()
name = "dna"

x = 4
y = 4

data = read.csv(file = paste(name, ".csv", sep = ""), head = TRUE, sep = ";", dec = ",", check.names = FALSE)
pdf(file = paste(name, ".pdf", sep = ""), width = x, height = y, paper = "special", family = "Helvetica")
par(mar=c(4, 4, 2, 1))

start = 1
stop = 4
sampled = c(3,5)
locate = 7

width = 900
height = 40


plot(
  data[,1],
  data[,2],
  type = "b",
  xlab = "Size (MB)",
  ylab = "Number of steps",
  xlim = c(0, width),
  ylim = c(0, height),
  pch = 15)

for(i in start:stop)
{
  points(data[i, sampled], data[i, sampled + 1], type = "b", pch = 23)
}
points(data[, locate], data[, locate + 1], type = "b", pch = 17)

title(name)


dev.off()
q()
