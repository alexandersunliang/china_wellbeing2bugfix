#### Preamble ####
# Purpose: Downloads and saves the data from WSV
# Author: Alexander Sun
# Date: April 21st 2024
# Contact: alexander.sun@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("/Users/alexsun/Downloads/china_wellbeing/data/raw_data/wvsraw.csv")
cleaned_data <- raw_data %>%
  filter(B_COUNTRY_ALPHA == "CHN") %>%
  select(year = A_YEAR, national_pride = Q254, happiness = Q49, 
         surveillance_right = Q196, email_monitoring_right = Q197, 
         info_collection_right = Q198, government_responsibility = Q108, age = Q262) %>%
  filter(!if_any(c(national_pride, happiness, surveillance_right, 
                   email_monitoring_right, info_collection_right, 
                   government_responsibility, age), ~ . %in% c(-1, -2)))


cleaned_data <- cleaned_data %>%
  rename(
    Email_Monitoring = email_monitoring_right,
    Information_Collection = info_collection_right,
    Government_Surveillance = surveillance_right,
    National_Pride = national_pride,
    Happiness = happiness,
    Government_Responsibility = government_responsibility,
    Year = year
  )

#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data2018.parquet")

