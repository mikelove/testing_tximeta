# this is for testing ERCC data from Charlotte

library(tximeta)
coldata <- data.frame(
    names = "s1", 
    files = "ercc/oarfish-ercc-out/s1.quant"
)
se <- importData(
    coldata, 
    type = "oarfish",
    dropInfReps=TRUE
)
inspectDigests(se)
