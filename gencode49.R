# this is for testing GENCODE 49 related issue
# https://github.com/thelovelab/tximeta/issues/95

library(tximeta)
se <- tximeta(
  coldata = coldata,
  type = "salmon",
  txOut = TRUE,
  markDuplicateTxps = TRUE,
  cleanDuplicateTxps = TRUE
)
