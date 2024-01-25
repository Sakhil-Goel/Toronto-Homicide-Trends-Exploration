#### Preamble ####
# Purpose: Simulates a set of homicide data from 2004-2020
# Author: Sakhil Goel
# Date: 23 January 2024
# Contact: s.goel@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)

#### Simulate data ####
set.seed(111) # Setting a seed for reproducibility

# The number of data points for the simulation
data_points <- 1000

# Simulate a dataset
simulated_data <- 
  tibble(
    # Randomly pick a year, homicide_type, neighbourhood, and date for each data point
    year = sample(2004:2020, data_points, replace = TRUE),
    homicide_type = sample(c("Shooting", "Stabbing", "Other"),  data_points, replace = TRUE),
    neighbourhood = sample(1:140, data_points, replace = TRUE),
    date = format(
      as.Date(sprintf("%04d-01-01", year)) + sample(0:365, data_points, replace = TRUE),
      "%d-%m-%Y" # Randomly select a date of the form dd-mm-yyyy that matches the randomly generated year
    )
)

# View and save the data
head(simulated_data)
write_csv(simulated_data, "inputs/data/simulated_homicide_data.csv") 