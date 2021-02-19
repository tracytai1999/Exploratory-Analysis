# Summary information

#load packages
covid19 <- read.csv("COVID19_state.csv")
population <- read.csv("population.csv")

#state with highest covid-19 infected population

highest_state <- covid19 %>%
  filter(Infected == max(Infected, na.rm = T)) %>%
  pull(State)

# state with highest population
highest_pop_state <- population %>%
  filter(Pop == max(Pop, na.rm = T)) %>%
  pull(State)

# 



