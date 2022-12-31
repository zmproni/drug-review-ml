# 2nd Step of the project: Data cleaning
# (based on the results of the preliminary data exploration)

library(tidyverse)
library(plyr)
library(ggplot2)
library(dotenv)
library(stringr)
library(tidyr)

# Might remove later
load_dot_env(file = ".env")
working_dir <- Sys.getenv("WORKING_DIR")
setwd(working_dir)

# Read in the data
drugs_review <- read.csv(
  "./dataset/drugs_review.csv",
  sep = "\t",
  header = TRUE
)

# Drop column named X
cleaned <- drugs_review[, -1]

# Convert date (string) to date object
cleaned$date <- as.Date(cleaned$date, format = "%B %d, %Y")

# Null values
cleaned <- cleaned[cleaned$condition != "", ]

# Span values
cleaned <- cleaned[!str_detect(cleaned$condition, "span>"), ]

# Special character errors (html code)
cleaned$review <- str_replace_all(cleaned$review, "&#039;", "'")
cleaned$review <- str_replace_all(cleaned$review, "\"", "")
cleaned$review <- str_replace_all(cleaned$review, "&amp;", "&")
cleaned$review <- str_replace_all(cleaned$review, "&quot;", '"')
cleaned$review <- str_replace_all(cleaned$review, "&nbsp;", " ")
cleaned$review <- str_replace_all(cleaned$review, "&euro;", "$")
cleaned$review <- str_replace_all(cleaned$review, "&bull;", "")

# Make sure data is clean
# (no null values, no span values, no special character errors)
# check for html character codes

# Function to check for html character codes
check_html <- function(text) {
  expression <- "(&.{4};)"
  matches <- str_extract_all(text, expression)
  return(matches)
}

# Check for html character codes
unique(unlist(check_html(cleaned$review)))

# Check for null values
lapply(cleaned, function(x) {
  sum(x == "")
})

# Check for span values
dim(cleaned[str_detect(cleaned$condition, "span>"), ])

View(cleaned)

# Write the cleaned data to a csv file without row names
write.csv(
  cleaned,
  file = "processed/drug_review_cleaned.csv",
  row.names = FALSE
)
