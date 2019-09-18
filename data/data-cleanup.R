# load packages ----------------------------------------------------------------

library(tidyverse)

# load data --------------------------------------------------------------------

listings_raw <- read_csv("data/listings-raw.csv")

# clean up listings ------------------------------------------------------------

listings <- listings_raw %>%
  select(id, price, neighbourhood, accommodates, bathrooms, bedrooms, beds, 
         review_scores_rating, number_of_reviews, listing_url) %>%
  mutate(price = str_remove(price, "\\$") %>% as.numeric())

# save analysis data -----------------------------------------------------------

write_csv(listings, path = "data/listings.csv")
