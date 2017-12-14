##########################################

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "Fss06hid.csv")
Fss06hid <- read.csv(file = "Fss06hid.csv", header = TRUE)
strsplit(names(Fss06hid), "wgtp")[123]

##########################################

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
              destfile = "FGDP.csv")
FGDP <- read.csv(file = "FGDP.csv", header = TRUE, skip = 4, nrows = 190)

FGDP <- FGDP[,c(1,2,4,5)]
names(FGDP) <- c("CountryCode", "Ranking", "Economy", "GDP")

FGDP$GDP <- as.numeric(gsub(",", "", as.character(FGDP$GDP)))
mean(FGDP$GDP, na.rm = TRUE)


##########################################

grep("^United",FGDP$Economy)

##########################################

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
              destfile = "FGDP.csv")
FGDP <- read.csv(file = "FGDP.csv", header = TRUE, skip = 4, nrows = 190)
FGDP <- FGDP[,c(1,2,4,5)]
names(FGDP) <- c("CountryCode", "Ranking", "Economy", "GDP")

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", 
              destfile = "FEDSTATS_Country.csv")
FEDSTATS_Country <- read.csv(file = "FEDSTATS_Country.csv", header = TRUE)

joinDB <- inner_join(x = FGDP, y = FEDSTATS_Country, "CountryCode")

x <- grep(pattern = "Fiscal year end: June", joinDB$Special.Notes)
length(x)

##########################################

library(dplyr)
library(lubridate)
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

amzn.df <- as.data.frame(amzn)

x1 <- amzn.df %>%
    mutate(dat = row.names(amzn.df), dat = ymd(dat)) %>%
    filter(year(dat) == 2012)
nrow(x1)

x2 <- amzn.df %>%
    mutate(dat = row.names(amzn.df), dat = ymd(dat)) %>%
    filter(weekdays(dat) == "monday" & year(dat) == 2012)
nrow(x2)


##########################################


