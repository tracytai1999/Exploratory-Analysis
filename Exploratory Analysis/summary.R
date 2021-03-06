# Summary information

library(tidyverse)

# Load data
covid_19_state <- read_csv("COVID19_state.csv")

#Simplify the dataset to show the state and infections
states <- select(covid_19_state, State, Infected)

summary_info <- list()


# What is the highest number of infections in a state?
# `num_highest_state`
summary_info$num_highest_state <- states %>%
  select(State, Infected) %>%
  filter(Infected == max(Infected)) %>%
  pull(round(Infected, 0))

# What is the lowest number of infections in a state?
# `num_lowest_state`
summary_info$num_lowest_state <- states %>%
  select(State, Infected) %>%
  filter(Infected == min(Infected)) %>%
  pull(Infected)

# Which state has had the highest number of infections?
# `state_highest_infections`
summary_info$state_highest_cases <- states %>%
  filter(Infected == max(Infected)) %>%
  pull(State)

# Which state has had the lowest number of infections?
# `state_lowest_infections`
summary_info$state_lowest_infections <- states %>%
  filter(Infected == min(Infected)) %>%
  pull(State)

#Top 10 most infected states
summary_info$top_10 <- rownames_to_column(states, var = "rowname") %>%
  top_n(10, Infected) %>%
  pull(State)
