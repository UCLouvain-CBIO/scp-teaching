library("scp")
library("magrittr")
data(scp1)

qf <- scp1[, , 1:3]
names(qf) <- paste0("PSM", 1:3)
qf <- aggregateFeaturesOverAssays(qf,
                                  i = c("PSM1", "PSM2", "PSM3"), 
                                  name = c("Pep1", "Pep2", "Pep3"),
                                  fcol = "peptide",                            
                                  fun = colMedians)[, , 4:6]



png("qf_plot_qst1.png")
joinAssays(qf, 1:3, name = "Peptides") %>%
    aggregateFeatures("Peptides",
                      fcol = "protein",
                      name = "Proteins",
                      fun = colMedians,
                      na.rm = TRUE) %>%
    logTransform("Proteins",
                 name = "logProteins") %>%
    plot()
dev.off()


png("qf_plot_qst2.png")
logTransform(qf, "Pep1", "logPep1") %>%
    logTransform("Pep2", "logPep2") %>%
    logTransform("Pep3", "logPep3") %>%
    joinAssays(4:6, "logPeptides") %>% 
    aggregateFeatures("logPeptides",
                      fcol = "protein",
                      name = "logProteins",
                      fun = colMedians,
                      na.rm = TRUE) %>%
    plot()
dev.off()


png("qf_plot_qst3.png")
aggregateFeaturesOverAssays(qf,
                            i = c("Pep1", "Pep2", "Pep3"),
                            name = c("Prot1", "Prot2", "Prot3"),
                            fcol = "protein",                            
                            fun = colMedians) %>%
    logTransform("Prot1", "logProt1") %>%
    logTransform("Prot2", "logProt2") %>%
    logTransform("Prot3", "logProt3") %>%
    joinAssays(7:9, "logProteins") %>%
    plot()
dev.off()
