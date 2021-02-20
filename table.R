#run library 

library(tidyverse)


#run csv file 
gdp_data <- read_csv("GDP.csv")
population_data <- read_csv("population.csv")

#create new data frame
new_gdp_df <- gdp_data %>%
  select(State, stateGDP)

new_pop_df <- population_data %>%
  select(State, Pop, density)

#joining data frame
combine_df <- new_gdp_df %>%
  left_join(new_pop_df, by = "State") %>%
  group_by(State) 

#Rename the data frame
combine_df <- combine_df %>%
  rename(state = State, population = Pop)
