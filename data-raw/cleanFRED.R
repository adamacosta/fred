##############################################################################
##
## CLEAN AND BUILD THE FRED DATASETS
##
##############################################################################


library(dplyr)
library(tidyr)
library(lubridate)


# ------------------------ Consumer Credit --------------------------------- #

if (!file.exists(file.path('clean', 'cleanCredit.csv'))) {

    conCred <- read.csv(file.path('raw', 'rawCredit.csv'),
                        na.strings = c('ND', '')) %>%
        slice(-(1:5)) %>%
        setNames(c('period',
                   'nonrevolving',
                   'revolving',
                   'student'))

    conCred$period <- gsub('-01', '-Jan-1', conCred$period)
    conCred$period <- gsub('-02', '-Feb-1', conCred$period)
    conCred$period <- gsub('-03', '-Mar-1', conCred$period)
    conCred$period <- gsub('-04', '-Apr-1', conCred$period)
    conCred$period <- gsub('-05', '-May-1', conCred$period)
    conCred$period <- gsub('-06', '-Jun-1', conCred$period)
    conCred$period <- gsub('-07', '-Jul-1', conCred$period)
    conCred$period <- gsub('-08', '-Aug-1', conCred$period)
    conCred$period <- gsub('-09', '-Sep-1', conCred$period)
    conCred$period <- gsub('-10', '-Oct-1', conCred$period)
    conCred$period <- gsub('-11', '-Nov-1', conCred$period)
    conCred$period <- gsub('-12', '-Dec-1', conCred$period)

    conCred %>%
        mutate(period = ymd(period)) %>%
        write.csv(file.path('clean', 'cleanCredit.csv'), row.names = FALSE)

    rm(conCred)

}


# -------------------------- Balance Sheet --------------------------------- #


if (!file.exists(file.path('clean', 'cleanAssets.csv'))) {

    read.csv(file.path('raw', 'rawAssets.csv'), na.strings = c('ND', '')) %>%
        slice(-(1:5)) %>%
        setNames(c('period', 'assets')) %>%
        mutate(period = ymd(period)) %>%
        write.csv(file.path('clean', 'cleanAssets.csv'), row.names = FALSE)

}


# --------------------------- Mnoey Stock ---------------------------------- #


if (!file.exists(file.path('clean', 'cleanMoney.csv'))) {

    read.csv(file.path('raw', 'rawMoney.csv'), na.strings = c('ND', '')) %>%
        slice(-(1:5)) %>%
        setNames(c('period',
                   'm1',
                   'currency',
                   'demand',
                   'other',
                   'traveler',
                   'nonM1M2')) %>%
        mutate(period = ymd(period)) %>%
        write.csv(file.path('clean', 'cleanMoney.csv'), row.names = FALSE)

}


# --------------------- Industrial Utilitization --------------------------- #


if (!file.exists(file.path('clean', 'cleanIndCap.csv'))) {

    indCap <- read.csv(file.path('raw', 'rawIndCap.csv'),
                         na.strings = c('ND', '')) %>%
        slice(-(1:5)) %>%
        setNames(c('period',
                   'utilization',
                   'capacity',
                   'durable',
                   'nondurable'))

    indCap$period <- gsub('-01', '-Jan-1', indCap$period)
    indCap$period <- gsub('-02', '-Feb-1', indCap$period)
    indCap$period <- gsub('-03', '-Mar-1', indCap$period)
    indCap$period <- gsub('-04', '-Apr-1', indCap$period)
    indCap$period <- gsub('-05', '-May-1', indCap$period)
    indCap$period <- gsub('-06', '-Jun-1', indCap$period)
    indCap$period <- gsub('-07', '-Jul-1', indCap$period)
    indCap$period <- gsub('-08', '-Aug-1', indCap$period)
    indCap$period <- gsub('-09', '-Sep-1', indCap$period)
    indCap$period <- gsub('-10', '-Oct-1', indCap$period)
    indCap$period <- gsub('-11', '-Nov-1', indCap$period)
    indCap$period <- gsub('-12', '-Dec-1', indCap$period)

    indCap <- indCap %>%
        mutate(period = ymd(period)) %>%
        write.csv(file.path('clean', 'cleanIndCap.csv'), row.names = FALSE)

    rm(indCap)

}
