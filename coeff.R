m <- read.table("~/rna/lu_exp/rep.txt",row.names=1,head=T)
colnames(m)
m <- log2(m+0.000001)
fpkm <- c(2,4,6,8)
tpm <- c(1,3,5,7)

#caculate coefficient in table format
tpm_tablep <- cor(m[,tpm],method = c("pearson"))
tpm_tables <- cor(m[,tpm],method = c("spearman"))
fpkm_tablep <- cor(m[,fpkm],method = c("pearson"))
fpkm_tables <- cor(m[,fpkm],method = c("spearman"))


#calculate coefficients in rows format
tpm_name <- names(m)[tpm]
tpm_row <- as.data.frame(t(combn(tpm_name,2)))
fpkm_name <- names(m)[fpkm]
fpkm_row <- as.data.frame(t(combn(fpkm_name,2)))

tpm_outp <- apply(combn(tpm,2),2,function(x){cor(m[,x],method = c("pearson"))[2]})
tpm_outs <- apply(combn(tpm,2),2,function(x){cor(m[,x],method = c("spearman"))[2]})
fpkm_outp <- apply(combn(fpkm,2),2,function(x){cor(m[,x],method = c("pearson"))[2]})
fpkm_outs <- apply(combn(fpkm,2),2,function(x){cor(m[,x],method = c("spearman"))[2]})

tpmoutp <- cbind(tpm_row,tpm_outp)
tpmouts <- cbind(tpm_row,tpm_outs)
fpkmoutp <- cbind(fpkm_row,tpm_outp)
fpkmouts <- cbind(fpkm_row,tpm_outs)

#write.table(tpm_tablep,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=T,col.names=T)
write.table(tpmoutp,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=F,col.names=F)
#write.table(tpm_tables,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=T,col.names=T,append=T)
write.table(tpmouts,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=F,col.names=F,append=T)
#write.table(fpkm_tablep,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=T,col.names=T,append=T)
write.table(fpkmoutp,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=F,col.names=F,append=T)
#write.table(fpkm_tables,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=T,col.names=T,append=T)
write.table(fpkmouts,file="~/rna/lu_exp/coefficient.txt",sep="\t",row.names=F,col.names=F,append=T)

#plot the coefficient
pdf(file="coefficient.pdf")
panel.cor <- function(x,y, ...)
{ 
   par(usr=c(0,1,0,1))
   txt <- as.character(format(cor(x,y,method = c("spearman")),digits=4))
   text(0.5,0.5,txt,cex =2*abs(cor(x,y)))
}
pairs(m[,tpm],upper.panel=panel.cor,main=paste("Relationship of replicates with TPM",sep=""))
pairs(m[,fpkm],upper.panel=panel.cor,main=paste("Relationship of replicates with FPKM",sep=""))
dev.off()
