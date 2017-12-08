##########################

setwd("C:/Users/user/Documents/DataR")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "Fss06hid.csv")
Fss06hid<- read.csv(file = "Fss06hid.csv", header = TRUE)
agricultureLogical <- Fss06hid[which(Fss06hid$ACR == 3 & Fss06hid$AGS == 6), ]
agricultureLogical <- row.names(agricultureLogical)
agricultureLogical[1:3]  # "125" "238" "262"

##########################

library(jpeg)
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "Fjeff.jpg", mode = "wb")
img <- readJPEG(source = "Fjeff.jpg", native = TRUE)
quantile(img, probs = c(0.3, 0.8))

##########################
library(dplyr)

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "FGDP.csv")
FGDP <- read.csv(file = "FGDP.csv", header = TRUE, sep = ",", skip = 4, nrows = 215)
FGDP <- FGDP[, c(1,2,4,5)]
names(FGDP) <- c("CountryCode", "Ranking", "Long.Name", "Economy")

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "FEDSTATS_Country.csv")
FEDSTATS_Country <- read.csv(file = "FEDSTATS_Country.csv", header = TRUE)

mergeData <- merge(x = FGDP, y = FEDSTATS_Country, by.x = "CountryCode", by.y = "CountryCode", all = TRUE)

sum(!is.na(unique(mergeData$Ranking)))

mergeData <- arrange(mergeData, desc(Ranking))
mergeData[13, "Long.Name.x"]

##########################

mergeData %>% 
    group_by(Income.Group) %>% 
    summarise(avg = mean(Ranking, na.rm = TRUE))

##########################

library(Hmisc)
library(dplyr)
library(data.table)
mergeData2 <- mergeData %>%
    select(Income.Group, Ranking) %>%
    mutate(quantileGDP = cut2(Ranking, g = 5)) %>%
    data.table()
table(mergeData2$Income.Group, mergeData2$quantileGDP)

##########################