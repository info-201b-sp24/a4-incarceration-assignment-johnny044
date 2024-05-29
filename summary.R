# Load necessary libraries
library(dplyr)

# Load the data
data <- read.csv("~/Documents/Info201code/a4-incarceration-assignment-johnny044/prisonjailrates.csv")

# Filter the latest year data
latest_year <- max(data$year, na.rm = TRUE)
latest_data <- data %>%
  filter(year == latest_year)

# Calculate summary statistics
summary_info <- latest_data %>%
  summarise(
    avg_total_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE),
    max_total_jail_pop_rate = max(total_jail_pop_rate, na.rm = TRUE),
    min_total_jail_pop_rate = min(total_jail_pop_rate, na.rm = TRUE),
    avg_black_jail_pop_rate = mean(black_jail_pop_rate, na.rm = TRUE),
    avg_white_jail_pop_rate = mean(white_jail_pop_rate, na.rm = TRUE)
  )

summary_info

# Calculate change in total jail population rate over the last 10 years
trend_data <- data %>%
  filter(year >= (latest_year - 10)) %>%
  group_by(year) %>%
  summarise(avg_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE))

avg_annual_change <- trend_data %>%
  summarise(annual_change = (last(avg_jail_pop_rate) - first(avg_jail_pop_rate)) / 10)

avg_annual_change
