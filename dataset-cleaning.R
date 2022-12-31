# 2nd Step of the project: Data cleaning
# (based on the results of the preliminary data exploration)

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

cleaned <- drugs_review

# Convert date (string) to date object
cleaned$date <- as.Date(cleaned$date, format = "%B %d, %Y")

# Null values
cleaned <- drugs_review[drugs_review$condition != "", ]

# Span values
cleaned <- drugs_review[!str_detect(drugs_review$condition, "span>"), ]

# Special character errors (html code)
cleaned$review <- str_replace_all(cleaned$review, "&#039;", "'")
cleaned$review <- str_replace_all(cleaned$review, "\"", "")
cleaned$review <- str_replace_all(cleaned$review, "&amp;", "&")
cleaned$review <- str_replace_all(cleaned$review, "&quot;", '"')
cleaned$review <- str_replace_all(cleaned$review, "&nbsp;", " ")
cleaned$review <- str_replace_all(cleaned$review, "&euro;", "$")
cleaned$review <- str_replace_all(cleaned$review, "&bull;", "")

# Write the cleaned data to a csv file
write.csv(cleaned, file = "cleaned.csv")
