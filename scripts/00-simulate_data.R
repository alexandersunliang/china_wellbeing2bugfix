#### Preamble ####
# Purpose: Simulates data obtained for World Values Survey
# Author: Alexander Sun
# Date: April 21st 2024
# Contact: alexander.sun@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
set.seed(123)

#### Simulate data ####

# Generate simulation
wvsdata_simulation <- tibble(
  national_pride = rbinom(n = 3000, size = 5, prob = 0.6),  # National pride scores on a 0-5 scale
  government_surveillance = rbinom(n = 3000, size = 4, prob = 0.5),  # Government surveillance scores on a 0-4 scale
  email_monitoring = rbinom(n = 3000, size = 4, prob = 0.5),  # Email monitoring scores on a 0-4 scale
  information_collection = rbinom(n = 3000, size = 4, prob = 0.5),  # Information collection scores on a 0-4 scale
  happiness = rbinom(n = 3000, size = 10, prob = 0.5),  # Happiness scores on a 0-10 scale
  age = sample(18:70, 3000, replace = TRUE)  # Age of respondents
)

head(wvsdata_simulation)

summary(wvsdata_simulation)

write_csv(wvsdata_simulation, "data/raw_data/wvsdata_simulated.csv")




