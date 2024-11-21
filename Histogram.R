dataset <- read.csv("C:/Users/athul/OneDrive/Desktop/git/A22_Team_Research/Time.csv")




 library(ggplot2)
 
  
   ggplot(dataset, aes(x = confirmed)) +
  +     geom_histogram(color = "black", fill = "blue", bins = 20, alpha = 0.7) +
  +     labs(
    +         title = "Histogram of Confirmed Cases",
    +         x = "Number of Confirmed Cases",
    +         y = "Frequency"
    +) +
  +     theme_minimal()
 
   
   mean_confirmed <- mean(dataset$confirmed)
   sd_confirmed <- sd(dataset$confirmed)
   
    
     ggplot(dataset, aes(x = confirmed)) +
    +     geom_histogram(aes(y = ..density..), color = "black", fill = "blue", bins = 20, alpha = 0.7) +
    +     stat_function(
      +         fun = dnorm,
      +         args = list(mean = mean_confirmed, sd = sd_confirmed),
      +         color = "red",
      +         size = 1
      +) +
    +     labs(
      +         title = "Histogram of Confirmed Cases with Normal Curve Overlay",
      +         x = "Number of Confirmed Cases",
      +         y = "Density"
      +) +
    +    theme_minimal()