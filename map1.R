# Load necessary libraries
library(dplyr)
library(ggplot2)
library(maps)
library(mapdata)

# Load the data
data <- read.csv("~/Documents/Info201code/a4-incarceration-assignment-johnny044/prisonjailrates.csv")

# Filter the latest year data for mapping
latest_year <- max(data$year, na.rm = TRUE)
latest_data <- data %>%
  filter(year == latest_year)

# Get the map data for Washington State counties
county_map <- map_data("county", region = "washington")

# Merge the map data with the incarceration data
latest_data$region <- tolower(latest_data$county_name)
merged_data <- merge(county_map, latest_data, by = "region", all.x = TRUE)

# Create the map
ggplot(data = merged_data, aes(x = long, y = lat, group = group, fill = total_jail_pop_rate)) +
  geom_polygon(color = "black") +
  scale_fill_viridis_c(option = "plasma", na.value = "grey50") +
  labs(title = "Geographic Distribution of Total Jail Population Rates",
       fill = "Total Jail Population Rate") +
  coord_map() +
  theme_minimal()
