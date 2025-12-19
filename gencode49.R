# this is for testing GENCODE 49 related issue
# https://github.com/thelovelab/tximeta/issues/95

library(here)

names <- list.files(here("testing_tximeta/test_out/GENCODE49"))
files <- file.path(
  here("testing_tximeta/test_out/GENCODE49"), 
  names,"quant.sf"
)
coldata <- data.frame(files, names)

library(tximeta)
se <- tximeta(
  coldata = coldata,
  type = "salmon",
  markDuplicateTxps = TRUE,
  cleanDuplicateTxps = TRUE
)

# standard tximeta output doesn't do the swapping
se0 <- tximeta(
  coldata = coldata,
  type = "salmon",
  skipMeta = TRUE
)

txdb <- tximeta::retrieveDb(se)
library(GenomicFeatures)
txps <- transcripts(txdb)
names(txps) <- txps$tx_name
txps <- txps[!duplicated(names(txps))]
length(txps)

# cleaning 7877 duplicate transcript names
# marking 8791 transcript sets as duplicate sets
# ...
# 18498 out of 533740 txps were missing from GTF/GFF but were in the indexed FASTA

n <- nrow(se0) # number of transcripts in index

table(rownames(se) %in% txps$tx_name)
#   TRUE 
# 515242 

table(rownames(se0) %in% txps$tx_name)
#  FALSE   TRUE 
# 26375 507365 

nrow(se)

sum(mcols(se)$hasDuplicate)
# 16629

dups <- mcols(se)[mcols(se)$hasDuplicate,"duplicates"]

length(dups)
# 16629

sum(lengths(dups))
# 19443
