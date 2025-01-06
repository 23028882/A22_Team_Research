# Load necessary library
library(ggplot2)

# Scatter plot with adjusted axis scales
ggplot(data, aes(x = test, y = confirmed)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  scale_x_log10() +  # Apply logarithmic scale to the x-axis
  scale_y_continuous(limits = c(quantile(data$confirmed, 0.05), quantile(data$confirmed, 0.95))) +  # Zoom in on y-axis
  labs(
    title = "Adjusted Scatter Plot of Tests Conducted vs Confirmed Cases",
    x = "Number of Tests Conducted (Log Scale)",
    y = "Number of Confirmed Cases"
  ) +
  theme_minimal()

# Save the plot as a PNG
ggsave("adjusted_scatter_plot_tests_vs_confirmed.png", width = 8, height = 6)
