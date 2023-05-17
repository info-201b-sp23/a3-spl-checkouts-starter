# My choice graph

x_values <- seq(1, 3)
y_values <- seq(1, 3)

library("dplyr")
library("stringr")
library("ggplot2")

spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_df <- spl_df %>% 
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

author_df <- spl_df %>%
  filter(str_detect(Creator, "(i?)Colleen Hoover"))

checkouts_by_book <- ggplot(author_df, aes(y = Subjects)) + 
  geom_bar(color = "white", fill = "lightblue") +
  labs(title = "Colleen Hoover's Frequent Checked-Out Genres",
       x = "Amount",
       y = "Genre")

checkouts_by_book
