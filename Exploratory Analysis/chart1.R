# first chart

#load package
library(tidyverse)
library(scales)

# Load data
population <- read.csv("population.csv")
gdp <- read.csv("GDP.csv")
covid19 <- read.csv("COVID19_state.csv")

#find variables

#select useful columns from dataset
state_infected <- covid19 %>%
  select(State, Infected)

#order infected number in descending order and
#select states with top ten number of infection
top_ten_infected <- state_infected[order(-state_infected$Infected), ] %>%
  top_n(10) %>%
  arrange(Infected) %>%
  mutate(State = factor(State, State))
  
#create chart1
infected_bar_chart <- ggplot(data = top_ten_infected) +
  geom_col(mapping = aes(x = State, y = Infected, fill = Infected)) +
  labs(x = "States", y = "Infected Population",
       title = "Infected Population State Rank") +
  geom_text(aes(x = State, y = Infected, label = Infected),
            hjust = 1.5, color = "white", size = 3) +
  scale_fill_gradient(low = "skyblue", high = "royalblue4",
                      name = "Infected", labels = comma) +
  theme(legend.title = element_text(colour = "black", size = 10)) +
  theme(legend.text = element_text(colour = "black", size = 7)) +
  coord_flip()
