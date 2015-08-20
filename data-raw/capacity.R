library(dplyr)
library(lubridate)

capacity <- read.csv(file.path('data-raw', 'clean', 'cleanIndCap.csv')) %>%
    tbl_df() %>%
    mutate(period = ymd(period),
           utilization = as.numeric(utilization),
           durable = as.numeric(durable),
           nondurable = as.numeric(nondurable))

save(capacity, file = file.path('data', 'capacity.rda'))
