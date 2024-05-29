# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the data
data <- read.csv("~/Documents/Info201code/a4-incarceration-assignment-johnny044/prisonjailrates.csv")

# Filter data for the top 5 counties with the highest average jail population rates
top_counties <- data %>%
  group_by(county_name) %>%
  summarise(avg_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE)) %>%
  top_n(5, avg_jail_pop_rate) %>%
  pull(county_name)

# Filter data for trends over time for these counties
trend_data <- data %>%
  filter(county_name %in% top_counties)

# Create a line plot for trends over time
ggplot(trend_data, aes(x = year, y = total_jail_pop_rate, color = county_name)) +
  geom_line() +
  labs(title = "Trends in Jail Population Rates Over Time",
       x = "Year",
       y = "Total Jail Population Rate",
       color = "County") +
  theme_minimal()
