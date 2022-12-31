# 1st Step of the project: Preliminary data exploration

install.packages("tidyverse")
install.packages("markdown")
install.packages("dotenv")

library(tidyverse)
library(plyr)
library(ggplot2)
library(dotenv)
library(stringr)
library(tidyr)

load_dot_env(file = ".env")
working_dir <- Sys.getenv("WORKING_DIR")
setwd(working_dir)

# Read in the data
drugs_review <- read.csv(
  "./dataset/drugs_review.csv",
  sep = "\t",
  header = TRUE
)



# Preliminary data exploration

# View the first 10 rows of the data
drugs_review[1:10, ]

# Get statistical summary of the data
t(summary(drugs_review))

# Check the data types of the variables
str(drugs_review)

# Check the number of rows and columns
dim(drugs_review)
# 53766 rows and 6 columns



# Missing values

# Check the number of missing values in each column
colSums(is.na(drugs_review))
lapply(drugs_review, function(x) {
  sum(x == "")
})
# 'condition' has 295 missing values

# Determine why some of the values are missing
drugs_review[drugs_review$condition == "", ] %>%
  group_by(drugName) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

drugs_review[drugs_review$condition == "", ] %>%
  group_by(drugName) %>%
  summarise(n = n()) %>%
  filter(n == 1)

popular_drug <- "Ethinyl estradiol / norethindrone"
length(drugs_review[
  drugs_review$drugName == popular_drug,
]$drugName)
# Missing values don't seem to be related to the drug name



# Duplicates

# Check for duplicates
dim(drugs_review[duplicated(drugs_review), ])

# Check for duplicates excluding first columns 
dim(drugs_review[duplicated(drugs_review[, 2:6]), ])
# There are 5326 duplicates
# Same review for the same drug and condition
# on the same date as well as the same rating.
# Suspicious



# Dirty html tags

# Check for html character codes
expression <- "(&.{4};)"
text <- paste(drugs_review$review, collapse = ". ")
matches <- str_extract_all(text, expression)
unique(unlist(matches))
