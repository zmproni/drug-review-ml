# 2nd Step of the project: Data cleaning
# (based on the results of the preliminary data exploration)

library(tidyverse)
library(plyr)
library(ggplot2)
library(dotenv)
library(stringr)
library(tidyr)

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

# TODO: check for unicode characters (e.g. <U+2764>)

# Check for html character codes
unique(unlist(check_html(cleaned$review)))

# Check for null values
lapply(cleaned, function(x) {
  sum(x == "")
})

# Add a new column for the rating type (Target variable)
# Seperate ratings into 3 categories (positive, neutral, negative):
# where positive is 9-10, neutral is 5-8, and negative is 1-4
cleaned$rating_type <- ifelse(cleaned$rating >= 9, "positive",
  ifelse(cleaned$rating >= 5, "neutral", "negative"))

# Check for span values
dim(cleaned[str_detect(cleaned$condition, "span>"), ])

View(cleaned)

# Write the cleaned data to a csv file without row names
write.csv(
  cleaned,
  file = "processed/drug_review_cleaned.csv",
  row.names = FALSE
)
