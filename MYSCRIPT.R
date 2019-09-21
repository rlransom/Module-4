#Data from 3/26/19
#Seattle Pet Names
#Most popular pet names in Seattle for 2019

library(tidyverse)

pets <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-26/seattle_pets.csv")

top10 <- filter(pets, animals_name == 'Lucy' | animals_name == 'Charlie' | animals_name == 'Luna' | animals_name == 'Bella' | animals_name == 'Max' | animals_name == 'Daisy' | animals_name == 'Lily' | animals_name == 'Lola' | animals_name == 'Buddy' | animals_name == 'Molly')

myplot <- ggplot(data = top10) +
  geom_bar(mapping = aes(x= animals_name, fill = animals_name)) +
  labs(title = "2018 Top Seattle Pet Names",
       x = "Pet Name",
       y = "Number of Pets") +
  coord_flip()

myplot + theme_classic()

ggsave("myplot.pdf")
