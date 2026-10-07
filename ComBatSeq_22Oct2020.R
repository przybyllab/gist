# Apply ComBat-Seq
# Joanna Przybyl

library(sva)

# Read in the data
edata <- read.csv('countsGISTproteincoding_15Dec2020.csv', row.names=1)
edata <-as.matrix(edata)
head(edata)
dim(edata)

# Read in design file
design <- read.csv(file.choose())
head(design)

# Assign batch info from the design file
batch <- design$batch
batch

# Perform ComBat-Seq
adjusted <- ComBat_seq(edata, batch = batch, group = NULL)
class(adjusted)
head(adjusted)

# Write down corrected matrix
write.csv(adjusted, file = "ComBat_Seq_adjusted_58GIST_15Dec2020.csv")
