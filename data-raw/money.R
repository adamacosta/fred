library(dplyr)
library(lubridate)

money <- read.csv(file.path('data-raw', 'clean', 'cleanMoney.csv')) %>%
    tbl_df() %>%
    mutate(period = ymd(period),
           m1 = as.numeric(m1),
           currency = as.numeric(currency),
           demand = as.numeric(demand),
           other = as.numeric(other),
           traveler = as.numeric(traveler),
           nonM1M2 = as.numeric(nonM1M2))

save(money, file = file.path('data', 'money.rda'))
