2+3

print("hello world")

# My first program in R Programming
myString <- "Hello, World!"
print (myString)

var.1 = 5
var_1 = 7
x = 1 
print(ls())
print(ls(pattern="var"))

Gender<-"Female"
height<<-152
Weight = 81
3 -> f
23.5 ->> x
b <- seq(from = 0, to = 5)
c <- seq (from = 0, to = 10, by = 2)
v = 2L
w <<- 2 + 5i
a <-charToRaw("Hello")

print(class(Gender))
print(class(height))
print(class(f))
print(class(x))
print(class(b))
print(class(v))
print(class(w))

print(f+3)
print(height-x)
print(Weight*2)
print(b**2)
print(c^5)
m = height/100
print(Weight/(m**2))
BMI = Weight/(m**2)
print(b%%2)
print(c%/%2)

name <- readline(prompt="Enter name: ")
age <- readline(prompt="Enter age: ")
# convert character into numeric
age <- as.numeric(age)
print(paste("Hi,", name, "this year you are", age, "years old."))

#Question 1
num1 = 0.956786
num2 = 7.8345901

num1_r <- round(num1, 2)
num2_r = round(num2, 3)
print(paste(num1, num1_r))
print(paste(num2, num2_r))


numbers = seq(from = 1, to = 20, by = 1)
sqrt = numbers^2

?paste
demo(graphics)
demo(image)

getwd()

list.files()
data = read.csv("seattle-weather.csv, header = TRUE")

#Question 2
calculate_area <- function(radius) {
  return(pi * radius^2)
}

radius <- as.numeric(readline(prompt = "Enter the radius of the circle: "))

area <- calculate_area(radius)

cat("The area of the circle with the radius of", radius, "is", area, "\n")


#Question 3
#Plot 1

library(ggplot2)

setwd("C:/Users/wesya/OneDrive/Desktop/Screenshots/Lab Screenshots/Data Science/Lab 1/")

# Read the CSV file
data <- read.csv("seattle-weather.csv", header = TRUE)

# Display the first few rows of the data
head(data)
head(data$date)

# Histogram of Temperature Distribution
temperature_histogram <- ggplot(data, aes(x = temp_max)) + geom_histogram(binwidth = 5, fill = "skyblue", color = "black") + 
  theme_minimal() + labs(title = "Distribution of Maximum Temperatures", x = "Maximum Temperature (°F)", y = "Frequency")

# Display the histogram
print(temperature_histogram)



# Plot 2

library(ggplot2)

setwd("C:/Users/wesya/OneDrive/Desktop/Screenshots/Lab Screenshots/Data Science/Lab 1/")
data <- read.csv("seattle-weather.csv", header = TRUE)

# Convert date to Date type 
data$date <- as.Date(data$date, format = "%m/%d/%Y")

# Remove rows with missing values in the precipitation column
data <- na.omit(data[, c("date", "precipitation")])

# Plot: Line Plot of Precipitation Over Time
precipitation_line_plot <- ggplot(data, aes(x = date, y = precipitation)) + geom_line(color = "blue") + theme_minimal() + 
  labs(title = "Precipitation Over Time", x = "Date", y = "Precipitation (inches)")

# Display the line plot
print(precipitation_line_plot)


#Plot 3

library(dplyr)
library(ggplot2)

setwd("C:/Users/wesya/OneDrive/Desktop/Screenshots/Lab Screenshots/Data Science/Lab 1/")
data <- read.csv("seattle-weather.csv", header = TRUE)

# Inspect the date column
head(data$date)

#Box Plot of Maximum Temperature by Weather Type
box_plot <- ggplot(data, aes(x = weather, y = temp_max, fill = weather)) + geom_boxplot() + theme_minimal() + 
  labs(title = "Maximum Temperature by Weather Type", x = "Weather Type", y = "Maximum Temperature (°F)") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the box plot
print(box_plot)
















