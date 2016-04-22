m <- read.table("~/rna/rsem/repkeep_rsem.txt",row.names=1,head=T)
nameall <- c("Rep1","Rep1","Rep2","Rep2","Rep3","Rep3")
colnames(m) <- nameall
#  get those rows that contain 0 and other values are less than 1
DO <- function(x,y){
	a <- x
	a <- a[apply(t(apply(a,1,function(x){x>1})),1,any,drop=F),]

	a <- log2(a+1)
	a <- a[,y]
	a
}
ou <- c(2,4,6)
dan <- c(1,3,5)
mtpm <- DO(m,dan)
mfp <- DO(m,ou)
tmtpm <- t(mtpm)
tmfp <- t(mfp)
tpm.pca <- prcomp(tmtpm, retx=TRUE)
fpkm.pca <- prcomp(tmfp, retx=TRUE)

# draw the pca relationship
pdf(paste("pca.pdf",sep=""))
round(100*summary(tpm.pca)$importance[2,1],digits=2) -> a 
round(100*summary(tpm.pca)$importance[2,2],digits=2) -> b
round(100*summary(fpkm.pca)$importance[2,1],digits=2) -> c 
round(100*summary(fpkm.pca)$importance[2,2],digits=2) -> d
plot(tpm.pca$x[,1:2], pch=c(15:18), xlab=paste("PC1(",a,"% Proportion of Variance)"),ylab=paste("PC2(",b,"%) Proportion of Variance"),col=c("black","red"),main="TPM PCA Plot of Replicates 1,2,3")
legend("topright",cex=0.6,border=F, c(row.names(tpm.pca$x)),pch=c(15:18), col=c("black","red"),bty="n")
plot(fpkm.pca$x[,1:2], pch=c(15:18), xlab=paste("PC1(",c,"% Proportion of Variance)"),ylab=paste("PC2(",d,"%) Proportion of Variance"),col=c("black","red"),main="FPKM PCA Plot of Replicates 1,2,3")
legend("topright",cex=0.6,border=F, c(row.names(tpm.pca$x)),pch=c(15:18), col=c("black","red"),bty="n")
dev.off()

#plot the coefficient
pdf(file="coefficient.pdf")
panel.cor <- function(x,y, ...)
{ 
	   par(usr=c(0,1,0,1))
   txt <- as.character(format(cor(x,y,method = c("spearman")),digits=4))
      text(0.5,0.5,txt,cex =2*abs(cor(x,y)))
}
pairs(mtpm,upper.panel=panel.cor,main=paste("Relationship of replicates with TPM",sep=""))
pairs(mfp,upper.panel=panel.cor,main=paste("Relationship of replicates with FPKM",sep=""))
dev.off()

