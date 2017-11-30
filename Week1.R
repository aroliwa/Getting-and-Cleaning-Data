file.create("plik.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "plik.csv", 
              method = "auto")
data <- read.csv(file = "plik.csv", header = TRUE, sep = ",")

########################################

summary(as.factor(data$VAL)) #24 - 53

########################################

#Tidy data has one variable per column. 

########################################

library(openxlsx)
file.create("plikXLS.xlsx")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
              destfile = "plikXLS.xlsx", 
              method = "auto")
dat <- read.xlsx(xlsxFile = "plikXLS.xlsx", sheet = 1, rows = 18:23, cols = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T) #36534720

########################################

library(XML)
xmlsource <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlParse(file = xmlsource)
rootNode <- xmlRoot(doc)
xmlDataFrame <- xmlToDataFrame(rootNode[[1]])
xmlDataFrame %>%
    filter(zipcode == 21231) %>%
    count(zipcode) #127

########################################

library(data.table)
file.create("plik2.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", 
              destfile = "plik2.csv", method = "auto")
DT <- fread("plik2.csv", header = TRUE)

start <- Sys.time()
DT[,mean(pwgtp15),by=SEX]
end <- Sys.time() - start
end #0.004005909











