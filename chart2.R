# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the data
data <- read.csv("~/Documents/Info201code/a4-incarceration-assignment-johnny044/prisonjailrates.csv")

# Create a scatter plot comparing total jail population rate and total prison population rate
ggplot(data, aes(x = total_jail_pop_rate, y = total_prison_pop_rate)) +
  geom_point(alpha = 0.5) +
  labs(title = "Comparison of Jail and Prison Population Rates",
       x = "Total Jail Population Rate",
       y = "Total Prison Population Rate") +
  theme_minimal()
