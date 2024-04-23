#### Preamble ####
# Purpose: Tests the generated simulated data
# Author: Alexander Sun
# Date: April 21st 2024
# Contact: alexander.sun@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
wvsdata_simulation <- read.csv("data/raw_data/wvsdata_simulated.csv")
#### Test data ####
all(wvsdata_simulation$national_pride >= 0) 
all(wvsdata_simulation$government_surveillance >= 0)
all(wvsdata_simulation$email_monitoring >= 0)
all(wvsdata_simulation$information_collection >= 0)
all(wvsdata_simulation$happiness >= 0)
all(wvsdata_simulation$age >= 18 & wvsdata_simulation$age <= 70)
all(wvsdata_simulation$national_pride <= 5)
all(wvsdata_simulation$government_surveillance <= 4)
all(wvsdata_simulation$email_monitoring <= 4)
all(wvsdata_simulation$information_collection <= 4)
all(wvsdata_simulation$happiness <= 10)

#chisquare test to see if age is uniformly distributed
chisq.test(table(cut(wvsdata_simulation$age, breaks = seq(17, 71, by = 1) - 0.5)))

#check if mean and variance are reasonably close to expected values
expected_mean_pride <- 5 * 0.6
expected_variance_pride <- 5 * 0.6 * 0.4
actual_mean_pride <- mean(wvsdata_simulation$national_pride)
actual_variance_pride <- var(wvsdata_simulation$national_pride)
abs(expected_mean_pride - actual_mean_pride) < 0.5
abs(expected_variance_pride - actual_variance_pride) < 0.5
