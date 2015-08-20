library(dplyr)
library(lubridate)

assets <- read.csv(file.path('data-raw', 'clean', 'cleanAssets.csv')) %>%
    tbl_df() %>%
    mutate(period = ymd(period),
           assets = as.numeric(assets))


save(assets, file = file.path('data', 'assets.rda'))
