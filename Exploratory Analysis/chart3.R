# third chart
library(tidyverse)
library(ggplot2)
library(mapproj)
library(ggthemes)
library(lintr)

# Read data
covid19_state <- read.csv("COVID19_state.csv")

# Retrieve the states map data and merge with covid data

states_df <- select(covid19_state, State, Infected)

states_df <- states_df %>%
  rename(state = State)

states_map <- map_data("state")

# Merge Date
states_df$state <- tolower(states_df$state)

data <- merge(states_map, states_df, by.x = "region", by.y = "state")

# Create the map

chart3 <- ggplot(data) +
  geom_polygon(aes(long, lat, group = group, fill = Infected)) +
  coord_map("bonne", parameters = 45) +
  ggthemes::theme_map() +
  labs(title = "US COVID Infections map")
