# Project Title 
Customer_sales_analysis

# Project Overview
This project analyzes customer retail sales data to find out regional performance, product category trends, high-value customers, and their distribution sales level. The dataset contains messy text formatting, inconsistent capitalization in two columns, and discount adjustments that required cleaning before proper analysis. 

# Data Description 
The dataset simulates retail transaction data containing customer names, regions, product categories, sales values, and discounts. The dataset contains six (6) variables and fifteen (15) rows. Variables include: 
order_id: Is the unique ID for each order
customer_name: Names of the customers that made the purchase
region: Geographic area where the order was made
category: Type of product (e.g., Furniture, Technology, Office Supplies)
sales: Total amount of money from the order
discount: Reduction applied to the sales price.

# Data Cleaning
The dataset contained inconsistent capitalization in customer names and region columns. 
The data cleaning steps included: 
•	Standardizing customer names using string functions
•	Standardizing region values
•	Creating a final_price column after discount adjustments
•	Creating a sales_level classification using case_when()

# Business Questions
•	Which Region Generates the Most Sales?
•	Which Product Category Performs Best?
•	Who Are the Top Customers?
•	What Is the Distribution of Sales Levels?
•	How Do Discounts Affect Final Price?

# Key Insights 
•	The West region generated the highest total sales (2600), slightly outperforming the East region.
•	Technology products generated the highest revenue among all categories.
•	Small number of customers contributed a large share of total revenue.
•	Most transactions fall into the Medium sales level category.
•	Discounts reduce final revenue but may encourage purchase activity.

# Visualization
Charts were created using ggplot2 to show sales by category

# Conclusion
This analysis demonstrates how data cleaning and exploratory analysis can reveal important sales patterns. The West region generated the highest sales, indicating stronger purchasing activity compared to other regions. The Technology category outperformed others and contributed the most revenue, making it a key driver of business performance.
