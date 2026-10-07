########################################################################################################################################
# SAMseq
########################################################################################################################################

library(samr)

edata <- read.csv('ComBat_Seq_adjusted_51GIST_21Dec2020_sorted_by_size_group.csv', row.names = 1)
dim(edata)
head(edata)

#Optional pre-filtering:
#edata <- as.matrix(edata)
#edata <- edata[ rowSums(edata) > 1, ]

y<-c(rep(1,16), rep(2,16), rep(3,19)) 

samfit <- SAMseq(edata, y, resp.type = "Multiclass", genenames=rownames(edata), fdr.output=0.05, random.seed=1234567)

print(samfit)

samfit$siggenes.table$genes.up
up <-samfit$siggenes.table$genes.up
up <- as.data.frame(up)
write.table(up, file="SAMseq_Multiclass_by_size_all51GISTs_31Dec2020.txt", quote=FALSE, sep=",")

