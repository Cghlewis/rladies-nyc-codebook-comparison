
library(codebookr)

source(here::here("data.R"))

study_codebook <- codebook(survey, title = "Pet Relationship Study", subtitle = "Various Authors", description = "This study was funded by the Pet Society. Here is a basic description of our study, our methods, our sample, and protocols.")

print(study_codebook, here::here("code","00_my_codebookr_codebook.docx"))
