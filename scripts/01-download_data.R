#### Preamble ####
# Purpose: Downloads and saves the data from WSV
# Author: Alexander Sun
# Date: April 21st 2024
# Contact: alexander.sun@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(arrow)
# [...UPDATE THIS...]

#### Download data ####
raw_data <- read_csv("/Users/alexsun/Downloads/china_wellbeing/data/raw_data/wvsraw.csv")


#### Save data ####
write_csv(raw_data, "wvsraw.csv") 
write_parquet(raw_data, "data/wvsraw.csv")
         
