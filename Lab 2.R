# Check the current working directory
getwd()

# Set the working directory to the folder containing the file
setwd("C:/Users/wesya/Downloads")

# List files in the directory to confirm the file is present
list.files()

# Read the CSV file
churn <- read.csv("Churn_Train.csv", header = TRUE)

# View the dataframe
View(churn)

# Install necessary packages (note the corrected quotes and package names)
install.packages(c("tidyverse", "dlookr"))
install.packages("vcd")
install.packages("corrplot")


# Load the libraries (note the corrected library loading function)
library(tidyverse)
library(dplyr)
library(dlookr)
library(vcd)
library(corrplot)

# Calculate descriptive statistics using the dlookr package
descriptive_stats <- describe(churn)

# Print the descriptive statistics
print(descriptive_stats)

# Test of normality
# if p-value is less than 0.05, it indicates that the variables do not follow a normal distribution
normality_test <- normality(churn)
print(normality_test)

# Visualization of normality
plot_normality(churn)

# Select only numeric columns for correlation calculation
numeric_columns <- churn %>% select(where(is.numeric))

# Calculation of correlation coefficient using cor()
correlation_matrix <- cor(numeric_columns, use = "complete.obs", method = "pearson")

# Print the correlation matrix
print(correlation_matrix)

# Visualize the correlation matrix using corrplot
corrplot::corrplot(correlation_matrix, method = "circle")

# Perform EDA based on target variables
# Grouping data by Internet Service
categ <- target_by(churn, Internet.Service)

# Analyze the relationship
cat_num <- relate(categ, Tenure)
summary(cat_num)
plot(cat_num)

# Adjust the plotting area
par(mar = c(5, 4, 4, 2) + 0.1)

# Create a mosaic plot
mosaic(~ Internet.Service + Gender, data = churn)

# Create static EDA report for PDF report
eda_paged_report(churn)

# Create dynamic EDA report
eda_web_report(churn)

