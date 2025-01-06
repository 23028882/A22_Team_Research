library(ggplot2)

dataset <- read.csv("C:/Users/athul/OneDrive/Desktop/git/A22_Team_Research/Time.csv")

if (!"confirmed" %in% names(dataset)) {
  stop("The 'confirmed' column does not exist in the dataset.")
}
if (!is.numeric(dataset$confirmed)) {
  stop("The 'confirmed' column must be numeric.")
}

mean_confirmed <- mean(dataset$confirmed, na.rm = TRUE)
sd_confirmed <- sd(dataset$confirmed, na.rm = TRUE)
min_confirmed <- min(dataset$confirmed, na.rm = TRUE)
max_confirmed <- max(dataset$confirmed, na.rm = TRUE)

x_limits <- c(min_confirmed, max_confirmed)

ggplot(dataset, aes(x = confirmed)) +
  geom_histogram(
    color = "black",
    fill = "blue",
    bins = 30,
    alpha = 0.7
  ) +
  scale_x_continuous(limits = x_limits) +
  labs(
    title = "Histogram of Confirmed Cases",
    x = "Number of Confirmed Cases",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(dataset, aes(x = confirmed)) +
  geom_histogram(
    aes(y = ..density..),
    color = "black",
    fill = "blue",
    bins = 30,
    alpha = 0.7
  ) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean_confirmed, sd = sd_confirmed),
    color = "red",
    size = 1
  ) +
  scale_x_continuous(limits = x_limits) +
  labs(
    title = "Histogram of Confirmed Cases with Normal Curve Overlay",
    x = "Number of Confirmed Cases",
    y = "Density"
  ) +
  theme_minimal()

cat("Mean of Confirmed Cases:", mean_confirmed, "\n")
cat("Standard Deviation of Confirmed Cases:", sd_confirmed, "\n")
cat("Range of Confirmed Cases: [", min_confirmed, ",", max_confirmed, "]\n")

