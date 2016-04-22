m <- read.table("~/rna/lu_exp/rep.txt",row.names=1,head=T)
colnames(m)
m <- log2(m+0.000001)
fpkm <- c(2,4,6,8)
tpm <- c(1,3,5,7)
mtpm <- t(m[,tpm])
mfp <- t(m[,fpkm])
#boxplot(m[,tpm], main="Boxplot of replicates' TPM data")
#boxplot(m[,fpkm], main="Boxplot of replicates' FPKM data")
mtpm.scaled <- data.frame(apply(mtpm,2,scale))
mfp.scaled <- data.frame(apply(mfp,2,scale) )
tpm.pca <- prcomp(mtpm, retx=TRUE)
fpkm.pca <- prcomp(mfp, retx=TRUE)
#plot(tpm.pca,type="l")        #  check which PC is the most important.
#plot(tpm.pca$x, pch="", main="PC.1 and PC.2 for tpm' data (blue=survived, red=died)")
#text(tpm.pca$x,label=c(1:29728),col=c(rep("blue",21),rep("red",28)))

# draw the pca relationship
pdf(paste("pca.pdf",sep=""))
round(100*summary(tpm.pca)$importance[2,1],digits=2) -> a 
round(100*summary(tpm.pca)$importance[2,2],digits=2) -> b
round(100*summary(fpkm.pca)$importance[2,1],digits=2) -> c 
round(100*summary(fpkm.pca)$importance[2,2],digits=2) -> d
plot(tpm.pca$x[,1:2], pch=c(15:18), xlab=paste("PC1(",a,"% Proportion of Variance)"),ylab=paste("PC2(",b,"%) Proportion of Variance"),col=c("black","red"),main="TPM PCA Plot of Replicates 1,2,3")
legend("bottomright",cex=0.6,border=F, c(row.names(tpm.pca$x)),pch=c(15:18), col=c("black","red"),bty="n")
plot(fpkm.pca$x[,1:2], pch=c(15:18), xlab=paste("PC1(",c,"% Proportion of Variance)"),ylab=paste("PC2(",d,"%) Proportion of Variance"),col=c("black","red"),main="FPKM PCA Plot of Replicates 1,2,3")
legend("bottomright",cex=0.6,border=F, c(row.names(tpm.pca$x)),pch=c(15:18), col=c("black","red"),bty="n")
dev.off()

