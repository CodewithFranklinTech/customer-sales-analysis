# Load the libraries 
library(tidyverse)
library(dplyr)
library(lubridate)
library(skimr)
library(ggplot2)
library(stringr)

# Create sales_data dataset 
sales_data <- tibble(
  order_id = 1:15,
  customer_name = c(
    "John Smith", "mary johnson", "DAVID LEE", "John Smith",
    "Anna Brown", "anna brown", "James Wilson", "JAMES WILSON",
    "Linda Garcia", "Michael Davis", "Sarah Miller", "sarah miller",
    "Chris Taylor", "David Lee", "john smith"
  ),
  region = c(
    "East", "West", "East", "South", "West", "west", "East",
    "South", "South", "West", "East", "east", "West", "South", "East"
  ),
  category = c(
    "Technology", "Furniture", "Office Supplies", "Technology",
    "Furniture", "Furniture", "Technology", "Office Supplies",
    "Technology", "Furniture", "Office Supplies", "Technology",
    "Furniture", "Technology", "Office Supplies"
  ),
  sales = c(500, 300, 200, 450, 700, 650, 800, 150, 400, 350, 220, 330, 600, 720, 210),
  discount = c(0.10, 0.20, 0.00, 0.15, 0.05, 0.10, 0.20, 0.05, 0.00, 0.10, 0.05, 0.10, 0.15, 0.05, 0.00)
)

sales_data

# Some customer names appear with different capitalization. 
# Example: John Smith, john smith. Clean the column so that all names follow the same format.
customers_name_sales_data <- sales_data %>%
  mutate(clean_names = str_to_title(str_trim(customer_name)))
customers_name_sales_data

# The region column contains inconsistent values: Example: West, west, East, east. 
# Make them consistent.
region_sales_data <- customers_name_sales_data %>%
  mutate(clean_region = str_to_title(str_trim(region)))
region_sales_data

# Find the number of unique customers in the dataset
region_sales_data %>%
  summarise(unique_customers = n_distinct(clean_names))

# Create a new column called: final_price. Formula: sales - (sales * discount)
sales_price_data <- region_sales_data %>%
  mutate(
    final_price = sales - (sales * discount)
  )
sales_price_data

# Create a column called: sales_level. Rules: sales >= 600 → "High", sales >= 300 → "Medium", otherwise → "Low"
level_sales_data <- sales_price_data %>%
  mutate(
    sales_level = case_when(
      sales >= 600 ~ "High",
      sales >= 300 ~ "Medium",
      TRUE ~ "Low"
    )
  )
level_sales_data

# Calculate the total sales by region.
total_sales_data <- level_sales_data %>%
  group_by(region) %>%
  summarise(total_sales = sum(sales)) %>%
  arrange(desc(total_sales))
total_sales_data

# Find the most profitable category by total sales.
profit_category <- level_sales_data %>%
  group_by(category) %>%
  summarise(total_revenue = sum(final_price)) %>%
  arrange(desc(total_revenue))
profit_category

# Find the top 3 customers by total sales.
top_customers <- level_sales_data %>%
  group_by(clean_names) %>%
  summarise(top_3_customers = sum(final_price)) %>%
  slice_max(top_3_customers, n = 3)
top_customers

# Count how many orders fall into each sales_level.
orders_sales_data <- level_sales_data %>%
  group_by(sales_level) %>%
  summarise(count_orders = n())
orders_sales_data

# Create one visualization showing: Sales by Category. Use ggplot2.
level_sales_data %>%
  group_by(category) %>%
  summarise(total_sales_cate = sum(sales)) %>%
  ggplot(aes(x = category, y = total_sales_cate, fill = category)) +
  geom_col() +
  ggtitle("Sales by Category")































