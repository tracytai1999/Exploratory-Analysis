# Summary information
library(tidyverse)

# Load data
COVID19_state <- read_csv("COVID19_state.csv")

#Simplify the dataset to show the state and infections
states <- select(cOVID19_state, State, Infected)

# What is the highest number of infections in a state?
# `num_highest_state`
num_highest_state <- 
  select(cOVID19_state, State, Infected) %>%
  filter(Infected == max(Infected)) %>%
  pull(Infected)

# What is the lowest number of infections in a state?
# `num_lowest_state`
num_lowest_state <- 
  select(cOVID19_state, State, Infected) %>%
  filter(Infected == min(Infected)) %>%
  pull(Infected)

# Which state has had the highest number of infections?
# `state_highest_infections`
state_highest_cases <- states %>%
  filter(Infected == max(Infected)) %>%
  pull(State)

# Which state has had the lowest number of infections?
# `state_lowest_infections`
state_lowest_infections <- states %>%
  filter(Infected == min(Infected)) %>%
  pull(State)

#Top 10 most infected states
top_10 <- rownames_to_column(states, var = "rowname") %>%
  top_n(10, Infected) %>%
  pull(State)
