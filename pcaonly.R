args <- commandArgs(trailingOnly = TRUE)
all.count <-read.table(file=args[1],row.names=1,header=T)
num=3
###########pca analysis############
tcounts <- t(all.count)
pca.total <- prcomp(log2(tcounts[,]+1), retx=TRUE)
#pca.total <- prcomp(log2(tcounts+1), retx=TRUE)
pdf("pca.pdf")
c = round(100*summary(pca.total)$importance[2,1],digits=2)
d = round(100*summary(pca.total)$importance[2,num],digits=2)
plot(pca.total$x[,1:2], pch=c(15:(14+num)), xlab=paste("PC1(",c,"% Proportion of Variance)"),ylab=paste("PC2(",d,"%) Proportion of Variance"),col=c(rep("black",num),rep("red",num),rep("green",num),rep("blue",num)),main="PCA Plot of Samples")
legend("bottomright",cex=0.6,border=F, c(row.names(pca.total$x)),pch=c(15:(14+num)), col=c(rep("black",num),rep("red",num),rep("green",num),rep("blue",num)),bty="n")
dev.off()


