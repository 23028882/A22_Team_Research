dataset <- read.csv("C:/Users/Vysakh Anilkumar/Desktop/TRDP/A22/Time.csv")

library(ggplot2)
> 
  > 
  > ggplot(dataset, aes(x = test, y = confirmed)) +
  +     geom_point(color = "blue", alpha = 0.7) +
  +     geom_smooth(method = "lm", color = "red", se = FALSE) +
  +     labs(
    +         title = "Relationship between Tests Conducted and Confirmed Cases",
    +         x = "Number of Tests Conducted",
    +         y = "Number of Confirmed Cases"
    +     ) +
  +     theme_minimal()
`geom_smooth()` using formula = 'y ~ x'
> 
  > 
  > png("relationship_tests_confirmed.png", width = 800, height = 600)
> print(
  +     ggplot(dataset, aes(x = test, y = confirmed)) +
    +         geom_point(color = "blue", alpha = 0.7) +
    +         geom_smooth(method = "lm", color = "red", se = FALSE) +
    +         labs(
      +             title = "Relationship between Tests Conducted and Confirmed Cases",
      +             x = "Number of Tests Conducted",
      +             y = "Number of Confirmed Cases"
      +         ) +
    +         theme_minimal()
)