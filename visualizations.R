installed.packages("lubridate")
installed.packages("ggplot2")
installed.packages("dplyr")

time_data <- read.csv("C:\Users\Vysakh Anilkumar\Documents\A22_Team_Research\Time.csv")
time_data$date <- as.Date(time_data$date, format="%Y-%m-%d")
> ggplot(time_data, aes(x = date, y = confirmed)) +
  +     geom_line(color = "blue", size = 1) +
  +     labs(title = "Time Series of Confirmed Cases",
             +          x = "Date",
             +          y = "Confirmed Cases") +
  +     theme_minimal()

