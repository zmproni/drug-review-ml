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

