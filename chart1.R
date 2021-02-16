# first chart

library(tidyverse)
# Load data

population <- read.csv("csvData.csv")

ggplot(data = population) +
  geom_point(mapping = aes(x = State, y = Pop))