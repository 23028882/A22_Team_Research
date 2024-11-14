#This Graph shows  the distribution of negative and confirmed results over time, with each date's bar stacked by test outcome.

install.packages("tidyr")

#Reshape data to long format for easier stacking

data_long <- data %>%
  select(date, negative, confirmed) %>%
  pivot_longer(cols = c(negative, confirmed), names_to = "Result", values_to = "Count")

#Plot stacked bar chart for negative and confirmed cases over time

ggplot(data_long, aes(x = as.Date(date), y = Count, fill = Result)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Chart of Test Outcomes Over Time",
       x = "Date", y = "Count") +
  scale_fill_manual(values = c("negative" = "gray", "confirmed" = "blue"), name = "Test Outcome") +
  theme_minimal()