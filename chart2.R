# second chart
library(tidyverse)
library(ggplot2)
library(dplyr)
library(maps)
library(mapproj)
library(patchwork)
library(lintr)

install.packages("scales")
library(scales)
#read file
gdp_chart <- read.csv("GDP.csv")


#select useful column in the GDP chart
by_gdb_count <- gdp_chart %>%
  select(State, stateGDP)

#Summarry
#which state has highest GDP?
highest_state_gdp <- gdp_chart %>%
  filter(stateGDP == max(stateGDP)) %>%
  pull(State)

#which state has high highest GDP perc?
highest_state_gdpperc <- gdp_chart %>%
  filter(stateGDPperc == max(stateGDPperc)) %>%
  pull(State)

#which state has highest GDP growth in 2018?
highest_state_gdp_growth <- gdp_chart %>%
  filter(gdpGrowth2018 == max(gdpGrowth2018)) %>%
  pull(State)

#what is the number of highest GDP?
highest_gdp <- gdp_chart %>%
  filter(stateGDP == max(stateGDP)) %>%
  pull(stateGDP)
  

#Table
top_ten_chart <- gdp_chart %>%
  top_n(10) %>%
  select(State, stateGDP)


#top 5 states that has high GDP
top_five_states <- by_gdb_count %>%
  top_n(5) %>%
  arrange(stateGDP) %>%
  mutate(Proportion = stateGDP / sum(stateGDP))


# Create a basic bar
pie_chart_basic <- ggplot(top_five_states,
  aes(x="", y=State, fill=as.factor(Proportion))) + 
  geom_bar(stat="identity", width=3)

# Convert to pie (polar coordinates) and add labels
pie_chart_label <- pie_chart_basic + coord_polar("y", start=0)+ 
  geom_text(aes(label = paste0(round(Proportion*100), "%")), 
            position = position_stack(vjust = 1), colour = "white")

# Add color scale (hex colors)
pie_chart_colr <- pie_chart_label + 
  scale_fill_manual(values = c("#55DDE0", "#33658A", "#2F4858",
                               "#F6AE2D", "#F26419", "#999999"))

# Remove labels and add title
pie_chart_title <- pie_chart_colr + 
  labs(x = "State", y = "State Proportion",
  fill = "Proportion", title = "State GDP")

# Tidy up the theme
pie_chart_theme <- pie_chart_title + theme_classic() +
  theme(axis.line = element_blank(),
  axis.text = element_blank(),
  axis.ticks = element_blank(),
  plot.title = element_text(hjust = 0.5, color = "#666666"))
  


