# this is for testing ERCC data from Charlotte

library(tximeta)
coldata <- data.frame(
    names = "s1", 
    files = "testing_tximeta/ercc/oarfish-ercc-out/s1.quant"
)
se <- importData(
    coldata, 
    type = "oarfish",
    dropInfReps=TRUE
)
inspectDigests(se)

ercc <- rtracklayer::import("ercc/ERCC92/ERCC92.gtf")
names(ercc) <- ercc$gene_id

makeLinkedTxpData(
    digest = "a146525d2a3138c7d69d2420dd81db7b9e2123998b14f9be048f79ebcd36fa65", 
    indexName = "ERCC92", 
    txpData = ercc,
    source = "ERCC", 
    organism = NA,
    release = "92", 
    genome = NA
)

inspectDigests(se)

se2 <- updateMetadata(se)

mcols(se2)

# > mcols(se2)
# DataFrame with 278488 rows and 9 columns
#                                   tx_name     tx_id              gene_id       index    source      type     score     phase
#                               <character> <integer>               <list> <character> <integer> <integer> <numeric> <integer>
# ENSMUST00000193812.2 ENSMUST00000193812.2         1 ENSMUSG00000102693.2   annotated        NA        NA        NA        NA
# ENSMUST00000082908.3 ENSMUST00000082908.3         2 ENSMUSG00000064842.3   annotated        NA        NA        NA        NA
# ENSMUST00000162897.2 ENSMUST00000162897.2      9352 ENSMUSG00000051951.6   annotated        NA        NA        NA        NA
# ENSMUST00000159265.2 ENSMUST00000159265.2      9353 ENSMUSG00000051951.6   annotated        NA        NA        NA        NA
# ENSMUST00000070533.5 ENSMUST00000070533.5      9354 ENSMUSG00000051951.6   annotated        NA        NA        NA        NA
# ...                                   ...       ...                  ...         ...       ...       ...       ...       ...
# ERCC-00164                     ERCC-00164        NA           ERCC-00164       novel         1         1         0        NA
# ERCC-00165                     ERCC-00165        NA           ERCC-00165       novel         1         1         0        NA
# ERCC-00168                     ERCC-00168        NA           ERCC-00168       novel         1         1         0        NA
# ERCC-00170                     ERCC-00170        NA           ERCC-00170       novel         1         1         0        NA
# ERCC-00171                     ERCC-00171        NA           ERCC-00171       novel         1         1         0        NA
#                      transcript_id
#                        <character>
# ENSMUST00000193812.2            NA
# ENSMUST00000082908.3            NA
# ENSMUST00000162897.2            NA
# ENSMUST00000159265.2            NA
# ENSMUST00000070533.5            NA
# ...                            ...
# ERCC-00164                DQ516779
# ERCC-00165                DQ668363
# ERCC-00168                DQ516776
# ERCC-00170                DQ516773
# ERCC-00171                DQ854994