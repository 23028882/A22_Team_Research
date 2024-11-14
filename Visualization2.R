# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the dataset and convert date format
data <- read.csv("C:\Users\Vysakh Anilkumar\Documents\A22_Team_Research\Time.csv)
data$date <- as.Date(data$date, format="%Y-%m-%d")

# Calculate mean and median of confirmed cases

mean_confirmed <- mean(data$confirmed, na.rm = TRUE)
median_confirmed <- median(data$confirmed, na.rm = TRUE)

# 1. Scatterplot with mean line

ggplot(data, aes(x = test, y = confirmed)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") + # Adds a trend line
  geom_hline(yintercept = mean_confirmed, color = "purple", linetype = "dashed", size = 1) +
  labs(title = "Correlation Between Number of Tests and Confirmed Cases",
       subtitle = paste("Mean of Confirmed Cases =", round(mean_confirmed, 2)),
       x = "Number of Tests",
       y = "Number of Confirmed Cases") +
  theme_minimal()

# 2. Boxplot with mean indicator

data$test_level <- ifelse(data$test >= median(data$test), "High", "Low")

# Calculate mean by test level
mean_by_level <- data %>% group_by(test_level) %>% summarize(mean_confirmed = mean(confirmed, na.rm = TRUE))

ggplot(data, aes(x = test_level, y = confirmed, fill = test_level)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", color = "red", shape = 4, size = 3) + # Mean as red X mark
  labs(title = "Comparison of Confirmed Cases on High vs Low Testing Days",
       x = "Testing Level",
       y = "Number of Confirmed Cases") +
  theme_minimal()

# 3. Stacked Barplot of Proportions (unchanged as it doesn't involve mean/median)
data_long <- data %>%
  select(date, negative, confirmed) %>%
  pivot_longer(cols = c(negative, confirmed), names_to = "Result", values_to = "Count")

ggplot(data_long, aes(x = as.Date(date), y = Count, fill = Result)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(title = "Proportion of Negative and Confirmed Test Results Over Time",
       x = "Date", y = "Proportion") +
  scale_fill_manual(values = c("negative" = "gray", "confirmed" = "blue"), name = "Test Outcome") +
  theme_minimal()

# 4. Histogram with mean and median lines for confirmed cases
ggplot(data, aes(x = confirmed)) +
  geom_histogram(binwidth = 10, color = "black", fill = "blue") +
  geom_vline(xintercept = mean_confirmed, color = "red", linetype = "dashed", size = 1) +
  geom_vline(xintercept = median_confirmed, color = "green", linetype = "dotted", size = 1) +
  labs(title = "Distribution of Confirmed Cases",
       subtitle = paste("Mean =", round(mean_confirmed, 2), ", Median =", round(median_confirmed, 2)),
       x = "Number of Confirmed Cases",
       y = "Frequency") +
  theme_minimal()
