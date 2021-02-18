# third chart
library(tidyverse)
library(ggplot2)
library(mapproj)
library(ggthemes)

# Read data
cOVID19_state <- read.csv("COVID19_state.csv")

# Retrieve the states map data and merge with covid data

states <- 
  select(cOVID19_state, State, Infected)

states_map <- map_data("state")


# Merge Date
states$State <- tolower(states$State)
data <- merge(states_map, states,
              by.x = 'region',
              by.y = 'State')


# Create the map

ggplot(data) +
  geom_polygon(aes(long, lat, group = group, fill = Infected)) +
  coord_map("bonne", parameters=45) +
  ggthemes::theme_map() +
  labs(title = 'US COVID Infections map ')