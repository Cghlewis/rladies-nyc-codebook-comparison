
library(memisc)

source(here::here("data.R"))

study_codebook <- memisc::codebook(survey)

memisc::Write(study_codebook, file = here::here("code","my_memisc_codebook.txt"))
