file.create("file.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "file.csv", 
              method = "auto")
data <- read.csv(file = "file.csv", header = TRUE, sep = ",")

########################################

summary(as.factor(data$VAL)) #24 - 53

########################################

#Tidy data has one variable per column. 

########################################

library(openxlsx)
file.create("fileXLSX.xlsx")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
              destfile = "fileXLSX.xlsx", 
              method = "auto")
dat <- read.xlsx(xlsxFile = "fileXLSX.xlsx", sheet = 1, rows = 18:23, cols = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T) #36534720

########################################

library(XML)
library(dplyr)
xmlsource <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlParse(file = xmlsource)
rootNode <- xmlRoot(doc)
xmlDataFrame <- xmlToDataFrame(rootNode[[1]])
xmlDataFrame %>%
    filter(zipcode == 21231) %>%
    count(zipcode) #127

########################################

library(data.table)
file.create("file2.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", 
              destfile = "file2.csv", method = "auto")
DT <- fread("file2.csv", header = TRUE)

start <- Sys.time()
DT[,mean(pwgtp15),by=SEX]
end <- Sys.time() - start
end #0.004005909











