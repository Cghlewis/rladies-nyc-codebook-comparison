
library(sjPlot)

source(here::here("data.R"))

sjPlot::view_df(survey,
                show.type = TRUE,
                show.frq = TRUE,
                show.prc = TRUE, 
                show.na = TRUE,
                show.string.values = TRUE,
                file = here::here("code", "04_my_sjplot_codebook.html"))
