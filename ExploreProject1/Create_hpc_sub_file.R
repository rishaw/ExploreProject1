# Scripts to create the hpc_sub.csv which holds the data read by the plot files

packages <- c("data.table", "xlsx", "XML")
sapply(packages, require, character.only = TRUE, quietly = TRUE)


library(XML)
library(xlsx)
library(data.table)
library(stringr)
library(jpeg)
library(reshape2)

# extract the data

hpcfile <- "household_power_consumption.txt"

filepath <- str_c("c:", 
                  "users", 
                  "ishaw", 
                  "documents", 
                  "ExploreCourse1",
                  sep = "/",
                  collapse = NULL)
filepath
setwd(filepath)
getwd()
list.files()  

hpc <- {}
con <- file(hpcfile,"r")
hpc <- read.table(con, header = TRUE, sep = ";", na.string = "?")
close(con)

str(hpc)
ncol(hpc)
nrow(hpc)
names(hpc)

hpc <- cbind(DateTime = strptime(
  str_c(hpc$Date,
        hpc$Time,
        sep = " ",
        collapse = NULL), 
  format = "%d/%m/%Y %T"),
  Day =      strptime(
    str_c(hpc$Date,
          hpc$Time,
          sep = " ",
          collapse = NULL),
    format = "%a"),
  hpc)
head(hpc)


# subset the data range to between 2007-02-01 and 2007-02-02    

# startDate <- format("2007-02-01 00:00:00", format = "%d/%m/%Y %T")
# endDate <- format("2007-02-02 00:00:00", format = "%d/%m/%Y %T")

hpc_sub <- subset(hpc,
                  subset = DateTime >= format("2007-02-01 00:00:00", format = "%d/%m/%Y %T") &
                    DateTime <= format("2007-02-03 00:00:01", format = "%d/%m/%Y %T"),
                  select = c(-Date, -Time)
)
head(hpc_sub)

# Save  hpc_sub to a file to be used for the plots

write.table(hpc_sub, 
            file = "hpc_sub.csv", 
            append = FALSE, 
            quote = TRUE, 
            sep = ",",
            eol = "\n", 
            na = "NA", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            qmethod = c("escape", "double"),
            fileEncoding = "")

# check that we can read the data from the file

hpc_sub1 <- {}
hpc_sub1 <- read.csv(file="hpc_sub.csv", 
                     header = TRUE, 
                     sep = ",", 
                     quote = "\"")
