#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
wvsdata <- read_parquet(here("data/analysis_data/analysis_data2018.parquet"))

happiness_model <- stan_glm(
  Happiness ~ Government_Surveillance + Email_Monitoring + Information_Collection + National_Pride + age + Government_Responsibility,
  data = wvsdata,
  family = gaussian(),
  prior = normal(0, 2.5),
  prior_intercept = normal(0, 2.5),
  prior_aux = exponential(1),
  chains = 4,
  iter = 2000,
  seed = 123456,
  refresh = 0
)

# Optionally, save your model for future use
saveRDS(happiness_model, file = here::here("models/happiness_model.rds"))

