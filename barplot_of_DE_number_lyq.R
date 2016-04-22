pdf("barplot_of_DE_number.pdf")
sts1 <- read.table(file="aa",sep="\t",row.names=1)
t1 <- t(sts1)
library(RColorBrewer)
brewer.pal(9,"Paired") ->col
col <-"gray"
barplot(t1[1,]-1,ylim=c(-6000,6000),space=0.9,width=0.5,main="Number of differential expressed genes",axisnames=F, col=col,border=col) ->bar
abline(h=0)
text(bar,t1[1,]+200,t1[1,]-1)

barplot(-t1[2,]+1, add=T,col=col,border=col,space=0.9,width=0.5,,axisnames=F,) 
text(bar,-t1[2,]-200,t1[2,]-1)
text(bar,5800,rownames(sts1),cex=0.6)
abline(h=0)
dev.off()
