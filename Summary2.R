#loading data
library(tidyverse)
library(dplyr)

#load data frame
gdp <- read_csv("GDP.csv")

#Summarry
#which state has highest GDP?
highest_state_gdp <- gdp %>%
  filter(stateGDP == max(stateGDP)) %>%
  pull(State)

#which state has high highest GDP perc?
highest_state_gdpperc <- gdp %>%
  filter(stateGDPperc == max(stateGDPperc)) %>%
  pull(State)

#which state has highest GDP growth in 2018?
highest_state_gdp_growth <- gdp %>%
  filter(gdpGrowth2018 == max(gdpGrowth2018)) %>%
  pull(State)

#what is the number of highest GDP?
highest_gdp <- gdp %>%
  filter(stateGDP == max(stateGDP)) %>%
  pull(stateGDP)

#what is the state and number of highest GDP growth in 2018?
highest_gdp_growth_2018 <- gdp %>%
  filter(gdpGrowth2018 == max(gdpGrowth2018)) %>%
  select(State, gdpGrowth2018)
