#Graph to Visualize Confirmed, Released, Deceased cases over time

library(ggplot2)
library(dplyr)

#Load your Data set "time.csv"

data <- read.csv("C:\Users\Vysakh Anilkumar\Documents\A22_Team_Research\Time.csv")

# Plot trends for confirmed, released, and deceased cases over time

ggplot(data, aes(x = date)) +
  geom_line(aes(y = confirmed, color = "Confirmed")) +
  geom_line(aes(y = released, color = "Released")) +
  geom_line(aes(y = deceased, color = "Deceased")) +
  labs(title = "Trends of Confirmed, Released, and Deceased Cases Over Time",
       x = "Date", y = "Count") +
  scale_color_manual(name = "Status", values = c("Confirmed" = "blue", "Released" = "green", "Deceased" = "red")) +
  theme_minimal()