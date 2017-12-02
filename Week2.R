########################################

library(jsonlite)
url <- "https://api.github.com/users/jtleek/repos"
jsonData <- fromJSON(url)
jsonData %>%
    select(name, created_at) %>%
    filter(name == "datasharing")


########################################

library(sqldf)
acs <- read.csv.sql(file = "Fss06pid.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

########################################

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

########################################

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
for(i in c(10, 20, 30, 100)){
    print(nchar(htmlCode[i]))
}

########################################

x <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", 
              widths = c(15, 4, 4, 9, 4, 9, 4, 9, 4)
              ,header = F, skip = 4)
sum(x[,4])
