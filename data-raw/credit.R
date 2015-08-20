library(dplyr)
library(lubridate)

credit <- read.csv(file.path('data-raw', 'clean', 'cleanCredit.csv')) %>%
    tbl_df() %>%
    mutate(period = ymd(period),
           nonrevolving = as.numeric(nonrevolving),
           revolving = as.numeric(revolving),
           student = as.numeric(student))

save(credit, file = file.path('data', 'credit.rda'))
